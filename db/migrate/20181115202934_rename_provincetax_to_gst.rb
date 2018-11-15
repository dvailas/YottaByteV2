class RenameProvincetaxToGst < ActiveRecord::Migration[5.2]
  def change
    rename_column :provinces, :tax, :GST
    add_column :provinces, :PST, :decimal
    add_column :provinces, :HST, :decimal
  end
end
