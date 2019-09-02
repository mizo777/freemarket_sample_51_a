class AddDefultToProductsBrandId < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :brand_id, :bigint, :default => 1
  end
end
