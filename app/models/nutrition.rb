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

class Nutrition < ApplicationRecord
  has_many :dishes, dependent: :delete_all
  has_many :meals, through: :dishes

  mount_uploader :img, AvatarUploader

  validates :name, presence: true
  validates :energy,
            :protein,
            :lipid,
            :carbohydrate,
            :dietary_fiber,
            :saturated_fatty_acid,
            numericality: true,
            allow_nil: true
end
