# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  target_user :integer
#  target_date :date             not null
#  message     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :target_user, class_name: "User", foreign_key: "user_id"

  validates :message, presence: true
end
