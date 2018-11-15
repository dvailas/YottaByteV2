class Purchase < ApplicationRecord
  belongs_to :user
  has_many :purchase_products, :dependent => :destroy
  has_many :products, through: :purchase_products

  validates :user_id, :status, presence: true
  validates :subtotal, :total, numericality: true

  accepts_nested_attributes_for :purchase_products, allow_destroy: true
end
