# == Schema Information
#
# Table name: nutritions
#
#  id                   :integer          not null, primary key
#  name                 :string           not null
#  img                  :string
#  energy               :float            default(0.0)
#  protein              :float            default(0.0)
#  lipid                :float            default(0.0)
#  carbohydrate         :float            default(0.0)
#  dietary_fiber        :float            default(0.0)
#  saturated_fatty_acid :float            default(0.0)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryBot.define do
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
