class ChangeDataDeliveryBurdenToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :delivery_burden, :string
  end
end
