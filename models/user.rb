class User < ActiveRecord::Base
  has_many :tenshis, :dependent => :destroy
  has_many :follower_relationships, :class_name => "Relationship", :foreign_key => :following_id
  has_many :following_relationships, :class_name => "Relationship", :foreign_key => :follower_id
  has_many :followers, :through => :follower_relationships
  has_many :followings, :through => :following_relationships
end
