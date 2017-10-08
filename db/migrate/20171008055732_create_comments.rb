class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :meal, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
