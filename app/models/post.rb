class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :upvotes

  validates :body, presence: true
  validates :topic_id, presence: true

end
