class User < ActiveRecord::Base
  has_many :tenshis, :dependent => :destroy
  has_many :followers
  has_many :followings
end