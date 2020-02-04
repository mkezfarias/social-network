require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe 'error messages' do
    it 'gives an error message when user is not provided' do
      post = FactoryBot.build(:post, content: '')
      expect(post).not_to be_valid
      post.valid?
      expect(post.errors[:content]).to include('can\'t be blank')
    end

    it 'gives an error message when password is not provided' do
      post = FactoryBot.build(:post, user: nil)
      expect(post).not_to be_valid
      post.valid?
      expect(post.errors[:user_id]).to include('can\'t be blank')
    end
  end
end
