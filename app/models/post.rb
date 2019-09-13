class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :upvotes
end
