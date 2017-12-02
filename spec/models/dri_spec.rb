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

require "rails_helper"

RSpec.describe Dri, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
