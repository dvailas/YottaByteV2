class RenameProvinceToProvinceId < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :province, :province_id
  end
end
