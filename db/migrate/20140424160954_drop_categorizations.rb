class DropCategorizations < ActiveRecord::Migration
  def up
    drop_table :categorizations
  end

  def down
    create_table :categorizations do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps
    end
  end
end
