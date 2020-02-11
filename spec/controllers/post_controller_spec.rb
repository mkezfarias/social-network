require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #show' do
    context 'when user is logged in' do
      let(:user) { FactoryBot.create(:user) }
      let(:post) { FactoryBot.create(:post, user: user)
      }
      before(:each) do
        sign_in user
        get :show, params: { id: post.id }
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :show }
      it 'assigns the requested user to @user' do
        expect(assigns(:post)).to eq(post)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:user) { FactoryBot.create(:user) }
      before(:each) do
        sign_in user
        @post = FactoryBot.build(:post, user: user)
        post :create, params: { post: @post.attributes  }
      end

      it 'redirects to root path' do
        expect(response).to redirect_to root_path
      end

      it 'creates a new post' do
        expect{
          post :create, params: { post: FactoryBot.attributes_for(:post, user: user)}
        }.to change(Post, :count).by(1)
      end
    end
  end
end
