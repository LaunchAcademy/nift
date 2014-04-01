class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body, null: false

      t.timestamps
    end
  end
end
