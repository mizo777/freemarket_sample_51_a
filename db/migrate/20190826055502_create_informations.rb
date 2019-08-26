class CreateInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :informations do |t|
      t.string :title
      t.text :content, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
