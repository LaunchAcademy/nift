class AddRoleColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: "user"
  end

end
