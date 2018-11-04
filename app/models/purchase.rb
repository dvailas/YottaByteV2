class Purchase < ApplicationRecord
  belongs_to :user
  has_many :purchase_products
  has_many :products, through: :purchase_products

  validates :user_id, :dateCheckedOut, :status, presence: true
  validates :subtotal, :total, numericality: true
end
