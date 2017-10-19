class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user,  foreign_key: true
      t.references :target_user
      t.date :target_date, null: false
      t.text :message,     null: false

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :target_user_id
  end
end
