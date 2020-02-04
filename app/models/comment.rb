class Comment < ApplicationRecord
  validates :content, :post_id, :user_id, presence: true
  
  belongs_to :post
  belongs_to :user

  has_many :likes, as: :likeable
end
