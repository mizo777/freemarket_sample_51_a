class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :point, null: false
      t.text :reason, null: false
      t.references :user, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      t.integer :dead_line, null: false

      t.timestamps
    end
  end
end
