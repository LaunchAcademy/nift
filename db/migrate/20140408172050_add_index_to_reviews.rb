class AddIndexToReviews < ActiveRecord::Migration
  def up
    add_index :reviews, [:author_id, :product_id], unique: true
  end

  def down
    remove_index :reviews, [:author_id, :product_id]
  end
end
