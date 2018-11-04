class User < ApplicationRecord
  validates :name, :email, :password, :security,:address,:city,:country,:stateProvince, presence: true
  validates :email, uniqueness: true

end
