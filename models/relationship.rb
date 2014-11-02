<<<<<<< HEAD
class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"
  validates :follower, presence: true
  validates :following, presence: true
end
=======
class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"
  validates :follower, presence: true
  validates :following, presence: true
end
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
