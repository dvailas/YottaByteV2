class User < ApplicationRecord
  validates :name, :email, :password, :security,:address,:city,:country,:province, presence: true
  validates :email, uniqueness: true

end
