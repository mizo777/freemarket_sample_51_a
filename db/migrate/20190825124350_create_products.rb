class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.integer :price, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      # t.references :product_image, null: false, foreign_key: true
      t.references :user, foreign_key: true
      # t.references :order, null: false, foreign_key: true
      t.references :brand,  null: false, foreign_key: true
      t.string :size, null: false, index: true
      t.string :state, null: false, index: true
      t.integer :delivery_burden, null: false, index: true
      t.string :delivery_way, null: false
      t.string :delivery_from, null: false
      t.string :delivery_time, null: false
      t.text :detail
      t.integer :likes_count
      t.boolean :sold, default: false, index: true
      t.timestamps
    end
  end
end