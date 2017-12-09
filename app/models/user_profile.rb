# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  username   :string           not null
#  nickname   :string
#  avatar     :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gender     :integer
#  age        :integer
#

class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  enum gender: { male: 0, female: 1 }

  before_save :set_nickname

  validates :username, format: {
    with: /\A\w+\z/,
    message: "半角英数字とハイフンのみ使用できます",
  }

  validates :username, uniqueness: {
    case_sensitive: false,
    message: "このユーザー名は既に使われています",
  }

  private

    def set_nickname
      self.nickname = self.user.email_localname if self.nickname.blank?
    end
end
