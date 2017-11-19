# == Schema Information
#
# Table name: nutritions
#
#  id                   :integer          not null, primary key
#  name                 :string
#  energy               :float
#  protein              :float
#  lipid                :float
#  carbohydrate         :float
#  dietary_fiber        :float
#  saturated_fatty_acid :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Nutrition < ApplicationRecord
  has_many :dishes, dependent: :delete_all
  has_many :meals, through: :dishes
end
