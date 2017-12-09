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

require "rails_helper"

RSpec.describe Nutrition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
