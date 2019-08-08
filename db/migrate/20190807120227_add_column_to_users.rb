class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, index: true
    add_column :users, :last_name, :string,index: true
    add_column :users, :first_kana_name, :string
    add_column :users, :last_kana_name, :string
    add_column :users, :nickname, :string
    add_column :users, :birthday, :date
    add_column :users, :profile, :text
    add_column :users, :tel, :integer
    add_column :users, :postal_code, :integer
    add_column :users, :region, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :building, :string
    add_column :users, :payment_way, :string
    add_column :users, :confirmation_document, :text
  end
end
