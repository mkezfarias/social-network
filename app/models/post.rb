class Post < ApplicationRecord
  validates :content, :user_id, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable
end
