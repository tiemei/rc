class Comment < ActiveRecord::Base
  attr_accessible :body, :product_id, :user_id
  belongs_to :product, :counter_cache => :comment_count
  belongs_to :user
  
  validates :body, :presence => true

  # scope
  scope :last_creted, order("created_at DESC")
end
