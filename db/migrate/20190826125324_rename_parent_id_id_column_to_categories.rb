class RenameParentIdIdColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :parent_id_id, :parent
  end
end
