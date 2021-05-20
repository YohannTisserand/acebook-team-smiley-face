class User < ApplicationRecord
  has_many :comments
  has_secure_password
  validates :email, uniqueness: true
end
