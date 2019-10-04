class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :topics, through: :posts
  has_many :upvotes

  #take our validates :password because this already provided by has_secure_password
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validates :username, length: { maximum: 25,
  too_long: "%{count} characters is the maximum allowed" }
  validates :password, length: { minimum: 8,
  too_short: "%{count} characters is the minimum allowed" }



  def self.most_active
    self.joins(:posts)
        .select("users.*, count(posts.id) as pcount")
        .group("users.id")
        .order("pcount DESC")
        .limit(1).to_a.pop
  end

end
