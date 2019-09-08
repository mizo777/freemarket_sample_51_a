class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.text :content, null: false
      t.references :comment, foreign_key: true, null: false
      t.boolean :checked, defult: false
      t.references :user, foreign_key: true, null: false
      t.references :information, foreign_key: true, null: false

      t.timestamps
    end
  end
end
