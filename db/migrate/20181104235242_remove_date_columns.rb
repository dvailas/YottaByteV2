class RemoveDateColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :datecheckedout
    remove_column :products, :dateadded
    remove_column :products, :lastupdated
  end
end
