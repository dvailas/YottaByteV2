class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.date :datecheckedout
      t.decimal :subtotal
      t.decimal :total
      t.references :purchasedby, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
