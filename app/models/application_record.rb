class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #make those helpers available in the view

  scope :order_by_created, -> {order(created_at: :asc)}

  scope :order_by_updated, -> {order(updated_at: :asc)}

  scope :oldest, -> { order(:created_at).first }



  def self.most_upvoted
    joins(:upvotes).group("posts.id").count.sort_by{|k, v| v}.reverse.to_h
  end


end
