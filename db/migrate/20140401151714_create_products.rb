class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :url
      t.integer :author_id, null: false
      t.integer :company_id
      t.decimal :price
      t.string :release_date
      t.string :tags

      t.timestamps
    end
  end
end
