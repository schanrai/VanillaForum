class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_id, presence: true
  validates_uniqueness_of :post_id, scope: :user_id
  #avoids duplicate upvotes from same user
end
