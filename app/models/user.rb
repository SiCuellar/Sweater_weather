class User < ApplicationRecord
  validates_presence_of :email, presence: true, uniqueness: true
  validates_presence_of :password, confirmation: true

  has_secure_password
end
