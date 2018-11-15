class User < ApplicationRecord
  belongs_to :province
  validates :name, :email, :password, :security,:address,:city,:country,:province, presence: true
  validates :email, uniqueness: true

end
