class RenameParentColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :parent, :parent_id
  end
end
