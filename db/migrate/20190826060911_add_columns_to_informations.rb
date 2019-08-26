class AddColumnsToInformations < ActiveRecord::Migration[5.2]
  def change
    add_reference :informations, :contact, foreign_key: true, null: false
    add_reference :informations, :notice, forØeign_key: true, null: false
  end
end
