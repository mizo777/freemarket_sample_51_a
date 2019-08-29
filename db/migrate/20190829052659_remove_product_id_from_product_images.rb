class RemoveProductIdFromProductImages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :product_images, :product, foreign_key: true
  end
end
