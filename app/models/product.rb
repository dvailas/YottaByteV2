class Product < ApplicationRecord
  belongs_to :category , optional: true
  has_many :purchase_products
  has_many :purchases, through: :purchase_products

  validates :name, :price, :stock, presence: true
  validates :price, :stock, numericality: true

end
