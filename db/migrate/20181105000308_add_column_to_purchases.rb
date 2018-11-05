class AddColumnToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :dateCheckedOut, :date
  end
end
