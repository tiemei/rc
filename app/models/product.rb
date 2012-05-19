class Product < ActiveRecord::Base
  attr_accessible :bimg, :comment_count, :description, :name, :price, :simg, :to_url, :love

  has_many :comments
  has_many :orders

  validates :name, :presence => true
  validates :price, :presence => true
  validates :simg, :presence => true
  validates :price, :numericality => true
  
  def addlove
    self.love = 1 + self.love
    self.save
  end
end
