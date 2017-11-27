# == Schema Information
#
# Table name: meals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  img        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :meal do
    user nil
    img "MyString"
  end
end
