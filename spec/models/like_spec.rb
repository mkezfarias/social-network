require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it {
      should validate_uniqueness_of(:user_id).scoped_to(:likeable_id,
                                                        :likeable_type)
        .with_message('You cannot like the same post again')
    }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:likeable) }
  end
end
