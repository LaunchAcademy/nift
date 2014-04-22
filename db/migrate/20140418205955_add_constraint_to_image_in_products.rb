class AddConstraintToImageInProducts < ActiveRecord::Migration
  def up
    change_column :products, :image, :string, null: false
  end

  def down
    change_column :products, :image, :string
  end
end
