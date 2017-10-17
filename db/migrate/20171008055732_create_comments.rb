class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :target_user, nill: false
      t.date :target_date, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
