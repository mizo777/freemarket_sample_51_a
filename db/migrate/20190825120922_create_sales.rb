class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :price, null: false
      t.string :reason, null: false
      t.references :user, foreign_key: true
      t.integer :dead_line

      t.timestamps
    end
  end
end
