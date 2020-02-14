require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'error messages' do
    it 'gives an error message when email is not provided' do
      user = FactoryBot.build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it 'gives an error message when password is not provided' do
      user = FactoryBot.build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include('can\'t be blank')
    end
  end
end
