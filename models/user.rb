class User < ActiveRecord::Base
  has_many :tenshis, :dependent => :destroy
end