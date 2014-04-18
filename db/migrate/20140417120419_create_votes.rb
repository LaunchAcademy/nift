class CreateVotes < ActiveRecord::Migration
  def up
    # drop_table :votes
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :user_id, null: false
      t.integer :review_id, null: false

      t.timestamps
    end
    add_index :votes, [:user_id, :review_id], unique: true
  end

  def down
    drop_table :votes
  end
end
