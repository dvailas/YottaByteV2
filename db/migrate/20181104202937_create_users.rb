class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :security
      t.string :address
      t.string :postalcode
      t.string :country
      t.string :stateprovince
      t.string :city

      t.timestamps
    end
  end
end
