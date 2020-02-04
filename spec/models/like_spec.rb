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

  describe 'like count' do
    it 'increments the count of likes in a post by 1' do
      user = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user, email: "aaa@aaaaa.com")
      post = user.posts.create(content: 'hello hellow')
      expect(post.likes.count).to eql(0)
      post.likes.create(user: user)
      expect(post.likes.count).to eql(1)
      post.likes.create(user: user2)
      expect(post.likes.count).to eql(2)
    end
  end

end
