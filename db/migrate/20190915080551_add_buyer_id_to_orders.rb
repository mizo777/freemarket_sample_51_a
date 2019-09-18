class AddBuyerIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :buyer, foreign_key: { to_table: :users }, null: false
  end
end
