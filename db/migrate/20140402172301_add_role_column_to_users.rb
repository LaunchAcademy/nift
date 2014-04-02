class AddRoleColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :role, :string, null: false, default: "user"
  end

  def down
    remove_column :users, :role
  end
end
