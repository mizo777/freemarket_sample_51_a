class RemoveParentIdIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :parent_id_id, :bigint
  end
end
