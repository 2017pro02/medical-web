class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_date, except: [:index, :new, :create]
  before_action :set_meal, only: [:edit, :update, :destroy]

  # GET /meals
  # GET /meals.json
  def index
    @meals = @user.meal
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @meals = Meal.where(created_at: @date.all_day)
    @comment = Comment.new
    @comments = Comment.where(target_user: @user, target_date: @date.all_day)
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    respond_to do |format|
      if @meal.save
        TvChannel.broadcast_to(current_user, { type: "meal", date: @meal.created_at, img: @meal.img })
        @user.followers.each do |follower|
          UserMailer.notify_new_meal(follower, current_user, @meal).deliver_later
        end
        format.html { redirect_to user_meals_path, notice: "Meal was successfully created." }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to URI.unescape(user_meal_path(date: @meal.created_at.strftime("%Y/%m/%d"))), notice: "Meal was successfully updated." }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy!
    respond_to do |format|
      format.html { redirect_to meals_url, notice: "Meal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def comment
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.target_user = @user
    @comment.target_date = @date

    respond_to do |format|
      if @comment.save
        TvChannel.broadcast_to(@user, { type: "comment", from: current_user.profile.nickname, message: @comment.message })
        format.html { redirect_to URI.unescape(user_meal_path(date: @date.strftime("%Y/%m/%d"))), notice: "Meal was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @meal }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_user
      @user = UserProfile.find_by!(username: params[:user_name][1..-1]).user
      render "errors/403", status: 403, layout: false unless current_user.following?(@user) || current_user == @user
    end

    def set_date
      year, month, day = params[:date].split("/")
      @date = Time.zone.local(year, month, day)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:img)
    end

    def comment_params
      params.require(:comment).permit(:message)
    end
end
