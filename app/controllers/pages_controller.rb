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

    @lack_nut = lack_nut
    render layout: false
  end

  private

    def lack_nut
      nutritions = ["energy", "protein", "lipid", "carbohydrate", "dietary_fiber", "saturated_fatty_acid"]
      result = {}
      Meal.where(user: current_user, created_at: (Date.current - 1.month)...(Date.current + 1)).each do |m|
        nutritions.each do |n|
          result[n] = m.nutritions.sum { |hash| hash[n] }
        end
      end
      if result.present?
        return result.min_by { |a| a[1] }[0].to_s
      else
        return 0
      end
    end
end
