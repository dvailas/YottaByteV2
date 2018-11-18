class User < ApplicationRecord
  belongs_to :province
  validates :name, :email, :password,:address,:city,:country,:province, presence: true
  validates :email, uniqueness: true

  def get_object
    return this
  end
end
