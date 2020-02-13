class Friendship < ApplicationRecord

  validates :friend_id, :user_id, presence: true
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :user_id, scope: :friend_id
end
