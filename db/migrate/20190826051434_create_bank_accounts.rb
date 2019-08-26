class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.string :bank, null: false
      t.string :account_type, null: false
      t.integer :branch_code, null: false
      t.integer :account_number, null: false
      t.string :account_holder_sei, null: false
      t.string :account_holder_mei, null: false
      t.text :adress, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
