class AddStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status, :int, null: false, default: 0
  end
end
