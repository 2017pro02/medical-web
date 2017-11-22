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

require "rails_helper"

RSpec.describe Dish, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
