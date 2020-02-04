class Like < ApplicationRecord
  validates :user, uniqueness: { scope: %i[likeable_id likeable_type],
                                 message: 'You cannot like the same post again'}
  belongs_to :likeable, polymorphic: true
  belongs_to :user
end
