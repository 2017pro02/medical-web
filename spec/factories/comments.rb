# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  target_user_id :integer
#  target_date    :date             not null
#  message        :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :comment do
    user nil
    meal nil
    message "MyText"
  end
end
