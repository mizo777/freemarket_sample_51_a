class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :product, foreign_key: true
      # t.set :position
      t.text :content, null: false
      # t.set :category, null: false
      t.references :user, foreign_key: true, null: false
      t.references :information, foreign_key: true, null: false

      t.timestamps
    end
  end
end
