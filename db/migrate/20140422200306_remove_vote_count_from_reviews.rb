class RemoveVoteCountFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :vote_count
  end

  def down
    add_column :reviews, :vote_count, :integer
  end
end
