class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null:false
    add_index :users, :first_name
    add_column :users, :last_name, :string, null:false
    add_index :users, :last_name
    add_column :users, :first_kana_name, :string, null:false
    add_column :users, :last_kana_name, :string, null:false
    add_column :users, :nickname, :string, null:false
    add_column :users, :password, :integer, null:false
    add_column :users, :profile, :text, null:false
    add_column :users, :payment_way, :string, null:false
    add_column :users, :birthday, :string
    add_column :users, :confirmation_document, :text
  end
end
