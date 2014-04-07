class RemoveUserNameColumnFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :user_name
  end

  def down
    add_column :users, :user_name, :string, null: false
  end
end
