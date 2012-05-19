class Order < ActiveRecord::Base
  attr_accessible :name, :num, :status, :sum_price, :tel, :user_id
  belongs_to :product
  has_many :addrs
end
