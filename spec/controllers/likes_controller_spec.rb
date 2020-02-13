require 'rails_helper'

RSpec.describe LikesController, type: :controller do

      describe 'POST #create' do
        context 'with valid user, posts and comment' do
          let(:user) { FactoryBot.create(:user) }
          let(:user2) { FactoryBot.create(:user) }

          before(:each) do
            sign_in user
            sign_in user2
            @post = user.posts.create(content: "El posto")
            @comment = @post.comments.create(content: "el commento", user: user2)
          end
    
          it 'increments post likes count by 1' do
            expect{  
                @post.likes.create(user: user)
            }.to change(@post.likes, :count).by(1)
          end

          it 'increments comment likes count by 1' do
            expect{  
                @comment.likes.create(user: user)
            }.to change(@comment.likes, :count).by(1)
          end

          it 'wont let user like twice' do
            expect{
                @post.likes.create(user: user)
                @post.likes.create(user: user2)
                @post.likes.create(user: user)
            }.to change(@post.likes, :count).by(2)
          end
        end

      end
    end
    
      describe 'DELETE #destroy' do
        context 'with valid user, posts and comment' do
          let(:user) { FactoryBot.create(:user) }
          let(:user2) { FactoryBot.create(:user) }

          before(:each) do
            sign_in user
            sign_in user2
            @post = user.posts.create(content: "El posto")
            @comment = @post.comments.create(content: "el commento", user: user2)
            @like = @post.likes.create(user: user)
            @like2 = @post.likes.create(user: user2)


          end
    
          it 'reduces post likes count by 1' do
            expect{  
                @like.delete
            }.to change(@post.likes, :count).by(-1)
          end

          it 'wont let user unlike twice' do
            expect{
                @like.delete
                @like2.delete
            }.to change(@post.likes, :count).by(-2)
          end
        end 
end
