class CreateNutritions < ActiveRecord::Migration[5.1]
  def change
    create_table :nutritions do |t|
      t.string :name, null: false
      t.string :img
      t.float :energy
      t.float :protein
      t.float :lipid
      t.float :carbohydrate
      t.float :dietary_fiber
      t.float :saturated_fatty_acid

      t.timestamps
    end
  end
end
