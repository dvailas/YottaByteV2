class Category < ApplicationRecord
  validates :name, :security, presence: true
  validates :name, uniqueness: true
end
