class AddDefaultValueToAverageRatingInProducts < ActiveRecord::Migration
  def up
    change_column :products, :average_rating, :integer, default: 0
  end

  def down
    change_column :products, :average_rating, :integer
  end
end
