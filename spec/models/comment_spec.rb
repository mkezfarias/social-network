require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe 'error messages' do
    it 'gives an error message when user is not provided' do
      comment = FactoryBot.build(:comment, content: '')
      expect(comment).not_to be_valid
      comment.valid?
      expect(comment.errors[:content]).to include('can\'t be blank')
    end

    it 'gives an error message when password is not provided' do
      comment = FactoryBot.build(:post, user: nil)
      expect(comment).not_to be_valid
      comment.valid?
      expect(comment.errors[:user_id]).to include('can\'t be blank')
    end
  end
end
