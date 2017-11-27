# == Schema Information
#
# Table name: relations
#
#  id          :integer          not null, primary key
#  follower_id :integer          not null
#  followed_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :relation do
    follower_id 1
    followed_id 1
  end
end
