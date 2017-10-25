class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(@profile.user.username), notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  private

    def set_user
      @user = UserProfile.find_by!(username: params[:name][1..-1]).user
      @profile = @user.profile
    end

    def profile_params
      params.require(:user_profile).permit(:username, :nickname, :avatar, :bio)
    end
end
