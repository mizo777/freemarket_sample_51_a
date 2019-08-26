class CreateTransactionMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_messages do |t|
      t.references :order, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :message

      t.timestamps
    end
  end
end
