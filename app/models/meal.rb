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

class Meal < ApplicationRecord
  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :nutritions, through: :dishes

  mount_uploader :img, AvatarUploader
end
