# == Schema Information
#
# Table name: dris
#
#  id         :integer          not null, primary key
#  nut_type   :string           not null
#  gender     :integer          not null
#  age        :int4range        not null
#  val        :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :dri do
    nut_type "MyString"
    gender 1
    age 1
    val 1.5
  end
end
