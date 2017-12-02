class CreateDris < ActiveRecord::Migration[5.1]
  def change
    create_table :dris do |t|
      t.string :nut_type, null: false
      t.integer :gender, null: false
      t.int4range :age, null: false
      t.float :val, null: false

      t.timestamps
    end

    add_index :dris, [:nut_type, :gender, :age], unique: true
  end
end
