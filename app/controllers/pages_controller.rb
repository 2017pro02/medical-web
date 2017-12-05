class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def dashboard
  end

  def tv
    @meals2 = Meal.where(user: current_user, created_at: (Date.current - 2).all_day)
    @meals1 = Meal.where(user: current_user, created_at: (Date.current - 1).all_day)
    @meals0 = Meal.where(user: current_user, created_at: Date.current.all_day)
    @comments = Comment.where(target_user: current_user, target_date: (Date.current - 2)...Date.current + 1)
    render layout: false
  end
end
