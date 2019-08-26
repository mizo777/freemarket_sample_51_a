class AddColumnsToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :position, :string
    add_column :contacts, :category, :string, null: false
  end
end
