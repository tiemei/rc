class Post < ActiveRecord::Base
  attr_accessible :bimg, :content, :simg, :user_id
  belongs_to :user
  
  validates :content, presence: true

  def user
    @user ||= User.find(user_id)
  end
end
