# == Schema Information
#
# Table name: dishes
#
#  id           :integer          not null, primary key
#  meal_id      :integer          not null
#  nutrition_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :dish do
    meal nil
    nutrition nil
  end
end
