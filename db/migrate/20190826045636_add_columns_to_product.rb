class AddColumnsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :product_image, foreign_key: true, null: false
    add_reference :products, :order, foreign_key: true, null: false
  end
end
