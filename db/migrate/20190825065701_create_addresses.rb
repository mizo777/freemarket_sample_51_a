class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :mail, null: false, unique: true
      t.integer :tel
      t.integer :postal_code, null: false
      t.string :region, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
