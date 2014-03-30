class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"
  validates :follower, presence: true
  validates :following, presence: true
end
