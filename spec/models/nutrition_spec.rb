# == Schema Information
#
# Table name: nutritions
#
#  id                   :integer          not null, primary key
#  name                 :string
#  energy               :float
#  protein              :float
#  lipid                :float
#  carbohydrate         :float
#  dietary_fiber        :float
#  saturated_fatty_acid :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require "rails_helper"

RSpec.describe Nutrition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
