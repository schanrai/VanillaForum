class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #make those helpers available in the view

  scope :order_by_created, -> {order(:created_at)}

  scope :order_by_updated, -> {order(:updated_at)}
end
