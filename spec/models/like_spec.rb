require 'rails_helper'


RSpec.describe Like, type: :model do
  
  describe 'error messages' do
    it 'gives an error message when trying to like twice' do
      user = FactoryBot.create(:user)
      post = user.posts.create(content: 'hello hello hello')
      post.likes.create(user: user)
      like = post.likes.new(user: user)
      like.valid?
      expect(like.errors.full_messages.first).to include('again')
    end
  end

end
