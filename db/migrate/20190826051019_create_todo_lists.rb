class CreateTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.references :user, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      t.text :content, null: false
      t.references :transaction_message, foreign_key: true, null: false

      t.timestamps
    end
  end
end
