class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :url
      t.integer :user_id
      t.integer :company_id
      t.decimal :price
      t.string :release_date
      t.integer :category_id

      t.timestamps
    end
  end
end
