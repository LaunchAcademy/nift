class NullToUserId < ActiveRecord::Migration
  def change
    change_column :products, :user_id, null: false
  end
end
