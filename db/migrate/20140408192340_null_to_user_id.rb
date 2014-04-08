class NullToUserId < ActiveRecord::Migration
  def change
    change_column :products, :user_id, :integer, null: false
  end
end
