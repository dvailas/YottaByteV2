class CreatePurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_products do |t|
      t.references :product, foreign_key: true
      t.references :purchase, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.decimal :total

      t.timestamps
    end
  end
end
