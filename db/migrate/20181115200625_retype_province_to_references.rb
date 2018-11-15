class RetypeProvinceToReferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :province, :string
    add_column :users, :province, :integer, references: :provinces
  end
end
