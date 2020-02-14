require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:user) { FactoryBot.create(:user) }
      let(:user2) { FactoryBot.create(:user) }

      before(:each) do
        sign_in user
        @post = user.posts.create(content: 'El posto')
      end

      it 'creates a new comment' do
        expect do
          @post.comments.create(content: 'el commento', user: user2)
        end.to change(Comment, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:user) { FactoryBot.create(:user) }
      let(:user2) { FactoryBot.create(:user) }

      before(:each) do
        sign_in user
        @post = user.posts.create(content: 'El posto')
      end

      it 'wont create a new empty comment' do
        expect do
          @post.comments.create(content: '', user: user2)
        end.to change(Comment, :count).by(0)
      end
    end
  end
end
