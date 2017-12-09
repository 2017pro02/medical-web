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

class Dri < ApplicationRecord
  enum gender: { male: 0, female: 1 }
end
