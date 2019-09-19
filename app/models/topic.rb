class Topic < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts

  validates :title, presence: true
  validates :title, length: { maximum: 230,
    too_long: "%{count} characters is the maximum allowed" }

  validates_associated :posts




end
