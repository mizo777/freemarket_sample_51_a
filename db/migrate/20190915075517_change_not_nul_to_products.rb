class ChangeNotNulToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :orders, :use_point, true
    change_column_null :orders, :payment, true
    change_column_null :orders, :payment_way, true
    change_column_null :orders, :delivery_fee, true
    change_column_null :orders, :adress, true
    change_column_null :orders, :sell_fee, true
  end
end
