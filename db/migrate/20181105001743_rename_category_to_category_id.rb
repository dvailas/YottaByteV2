class RenameCategoryToCategoryId < ActiveRecord::Migration[5.2]
  def change
    rename_column(:products, :category_id, :category)
    rename_column(:products, :category, :category_id)
  end
end
