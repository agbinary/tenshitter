class Tenshi < ActiveRecord::Base
  belongs_to :user
  validates :message, presence: true
  validates :message, length: {in: 1..280 , message: "Must be 280 characters or less"}
end