class RemoveOrderIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :order, foreign_key: true
  end
end
