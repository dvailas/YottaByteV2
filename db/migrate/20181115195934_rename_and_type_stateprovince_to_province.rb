class RenameAndTypeStateprovinceToProvince < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :stateprovince, :province
  end
end
