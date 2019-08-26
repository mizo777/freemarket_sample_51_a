class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :use_point, null: false
      t.integer :payment, null: false
      t.string :payment_way, null: false
      t.integer :delivery_fee, null: false
      t.string :adress, null: false
      t.integer :sell_fee, null: false
      t.integer :sell_gain
      t.string :buyer_rank
      t.string :buyer_review
      t.string :seller_rank
      t.string :seller_reveiw
      t.boolean :payment_check
      t.boolean :delivery_check

      t.timestamps
    end
  end
end
