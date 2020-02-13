require 'rails_helper'

RSpec.describe Friendship, type: :model do

context 'with valid user, posts and comment' do

describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
end

describe 'validations' do
    it { is_expected.to validate_presence_of :friend_id }
    it { is_expected.to validate_presence_of :user_id }
  end

end

end
