class User < ApplicationRecord
  has_secure_password
  normalizes :email, with: ->(e) { e.strip.downcase }
  validates :email, presence: true, uniqueness: true

  validates :password, confirmation: true, presence: true
end
