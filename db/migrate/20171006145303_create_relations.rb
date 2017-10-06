class CreateRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end

    add_index :relations, :follower_id
    add_index :relations, :followed_id
    add_index :relations, [:follower_id, :followed_id], unique: true
  end
end
