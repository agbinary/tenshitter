class User < ActiveRecord::Base
  has_many :tenshis, :dependent => :destroy
  has_many :follower_relationships, :class_name => "Relationship", :foreign_key => :following_id
  has_many :following_relationships, :class_name => "Relationship", :foreign_key => :follower_id
  has_many :followers, :through => :follower_relationships
  has_many :followings, :through => :following_relationships
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true
  valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => valid_email , message: "Invalid format" }
  validates :email, uniqueness: {case_sensitive: false ,message: "Email address is already registered"}

  def tenshee(message)
    self.tenshis.create(message: message)
  end

  def retenshee(tenshi_id)
    tenshi = Tenshi.find(tenshi_id)
    self.tenshis.create(message: "RT @#{tenshi.user.username}: #{tenshi.message}", tenshi_id: tenshi_id)
  end

  def reply(message, reply_id)
    self.tenshis.create(message: "RE: #{message}", in_reply_to: reply_id)
  end

  def follow(other_user)
    Relationship.create(follower: self, following: other_user)
  end

  def unfollow(other_user)
    id = Relationship.find_by(follower: self, following: other_user)
    id.destroy
  end
end
