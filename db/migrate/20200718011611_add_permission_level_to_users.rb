class AddPermissionLevelToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :permission_level, :integer
  end
end
