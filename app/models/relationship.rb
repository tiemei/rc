class Relationship < ActiveRecord::Base
  # status : 1 contact 2 cotacted
  attr_accessible :status, :to_id, :user_id
  belongs_to :user

  def self.add_contact(user_id, to_id) 
    create(user_id: user_id, to_id: to_id, status: 1)
    create(user_id: to_id, to_id: user_id, status: 2)
  end

  def self.cancel_contact(user_id, to_id)
    where("user_id = #{ user_id } AND to_id = #{ to_id } AND status = 1")[0].destroy
    where("user_id = #{ to_id } AND to_id = #{ user_id } AND status = 2")[0].destroy
  end
  
  def self.is_contact?(user_id, to_id)
    where("user_id = #{ user_id } AND to_id = #{ to_id } AND status = 1").size == 1
  end

  def self.is_contacted?(user_id, to_id)
    where("user_id = #{ user_id } AND to_id = #{ to_id } AND status = 2").size == 1
  end

  def self.all_contact(user_id)
    select('to_id').where("user_id = #{ user_id } AND status = 1").to_a.map {|r| r.to_id}
  end

  def self.all_contacted(user_id)
    select('to_id').where("user_id #{ user_id } = AND status = 2").to_a.map {|r| r.to_id}
  end
end
