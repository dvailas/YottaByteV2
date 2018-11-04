class Product < ApplicationRecord
  belongs_to :category
  has_many :purchase_products
  has_many :purchases, through: :purchase_products

  validates :name, :category, :price, :stock, presence: true
  validates :price, :stock, numericality: true

end
