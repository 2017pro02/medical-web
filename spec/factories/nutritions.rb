# == Schema Information
#
# Table name: nutritions
#
#  id                   :integer          not null, primary key
#  name                 :string           not null
#  img                  :string
#  energy               :float
#  protein              :float
#  lipid                :float
#  carbohydrate         :float
#  dietary_fiber        :float
#  saturated_fatty_acid :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryGirl.define do
  factory :nutrition do
    name "MyString"
    energy 1.5
    protein 1.5
    lipid 1.5
    carbohydrate 1.5
    dietary_fiber 1.5
    saturated_fatty_acid 1.5
  end
end
