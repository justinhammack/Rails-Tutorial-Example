class Relationship < ActiveRecord::Base
  # users only follow/unfollow others, they can't force someone to follow them
  attr_accessible :followed_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
