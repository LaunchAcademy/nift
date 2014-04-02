class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :location
      t.string :url

      t.timestamps
    end
    add_index :companies, :name, unique: true
  end
end
