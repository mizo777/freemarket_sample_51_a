class ChangeProductIdToProductImage < ActiveRecord::Migration[5.2]
  def change
    change_column_null :product_images, :product_id, null: false
  end
end
