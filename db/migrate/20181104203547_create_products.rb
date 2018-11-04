class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.decimal :price
      t.string :description
      t.string :image
      t.integer :stock
      t.string :sku
      t.date :dateadded
      t.date :lastupdated
      t.boolean :onsale

      t.timestamps
    end
  end
end
