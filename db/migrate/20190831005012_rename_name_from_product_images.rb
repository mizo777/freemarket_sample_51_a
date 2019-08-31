class RenameNameFromProductImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :product_images, :name, :image
  end
end
