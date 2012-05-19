class User < ActiveRecord::Base
  attr_accessible :email, :name, :pwd, :sicon, :bicon
  has_many :relationships#, :dependent => :delete_all
  has_many :comments

  validates :email, :format => { with: /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,
                                 message: 'Wrong email addr'}
  validates :name, :presence => true
  validates :pwd, :format => { with: /\A[a-zA-Z0-9\?]+\z/,
                               message: "letters and numbers and ?  allowed" }
  validates_uniqueness_of :name
  validates_uniqueness_of :email
  

  def contact?(user)
    if user.instance_of?(User)
      Relationship.is_contact?(self.id, user.id)
    else
      Relationship.is_contact?(self.id, user)
    end
  end

  def contacted_by?(user)
    if user.instance_of?(User)
      Relationship.is_contacted?(self.id, user.id)
    else
      Relationship.is_contacted?(self.id, user)
    end
  end
  
  def contact_count
    Relationship.where("user_id = #{ self.id } AND status = 1").count
  end
  
  def contacted_count
    Relationship.where("user_id = #{ self.id } AND status = 2").count
  end
  
end
