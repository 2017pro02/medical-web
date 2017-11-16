class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def dashboard
  end

  def tv
    @meals2 = Meal.where(created_at: (Date.current - 2).all_day)
    @meals1 = Meal.where(created_at: (Date.current - 1).all_day)
    @meals0 = Meal.where(created_at: (Date.current.all_day))
    @world = "world"
    render layout: false
  end
end
