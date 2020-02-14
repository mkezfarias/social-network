require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #feed' do
    context 'when user logged in' do
      before(:each) do
        @user = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
        @friendship = @user.friendships.create(friend: @user2)
        @friendship.update(confirmed: true)
        sign_in @user
        get :feed
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'renders the :feed template' do
        expect(response).to render_template(:feed)
      end
      it 'populates and array of friendships' do
        expect(@friendship.confirmed).to eq(true)
        expect(@friendship.user).to eq(@user)
        expect(@friendship.friend).to eq(@user2)
        expect(assigns(:friendships)).to include(@friendship)
      end
      it 'populates an array of :posts' do
        posts = []
        5.times do
          posts.push FactoryBot.create(:post, user: @user)
        end
        expect(assigns(:posts)).to eq(posts.reverse)
      end
      it 'creates a new post' do
        expect(assigns(:post).id).to be_nil
      end
    end

    context 'when user not logged in' do
      it 'redirects' do
        get :feed
        expect(response).to have_http_status(:found)
      end
    end
  end
end
