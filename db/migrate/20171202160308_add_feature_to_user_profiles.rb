class AddFeatureToUserProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :gender, :integer
    add_column :user_profiles, :age, :integer
  end
end
