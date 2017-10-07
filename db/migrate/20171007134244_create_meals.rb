class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.belongs_to :user, foreign_key: true
      t.string :img

      t.timestamps
    end
  end
end
