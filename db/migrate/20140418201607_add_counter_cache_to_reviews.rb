class AddCounterCacheToReviews < ActiveRecord::Migration
  def change
    add_column :products, :reviews_count, :integer, default: 0
  end
end
