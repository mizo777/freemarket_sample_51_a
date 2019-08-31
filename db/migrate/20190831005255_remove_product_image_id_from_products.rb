class RemoveProductImageIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :product_image, foreign_key: true
  end
end
