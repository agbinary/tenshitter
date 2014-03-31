require 'active_record'

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
end
