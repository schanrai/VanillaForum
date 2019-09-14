class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :topics, through: :posts
  has_many :upvotes

  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :username, length: { maximum: 25,
  too_long: "%{count} characters is the maximum allowed" }
  validates :password, length: { minimum: 8,
  too_short: "%{count} characters is the minimum allowed" }


end
