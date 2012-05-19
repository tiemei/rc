class Addr < ActiveRecord::Base
  attr_accessible :addr
  belongs_to :user
end
