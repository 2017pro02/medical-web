class ChangeNutrition < ActiveRecord::Migration[5.1]
  def change
    change_column_default :nutritions, :energy, from: nil, to: 0.0
    change_column_default :nutritions, :protein, from: nil, to: 0.0
    change_column_default :nutritions, :lipid, from: nil, to: 0.0
    change_column_default :nutritions, :carbohydrate, from: nil, to: 0.0
    change_column_default :nutritions, :dietary_fiber, from: nil, to: 0.0
    change_column_default :nutritions, :saturated_fatty_acid, from: nil, to: 0.0
  end
end
