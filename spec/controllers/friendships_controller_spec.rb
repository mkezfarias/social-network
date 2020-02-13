require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user) }
    let(:friend) { FactoryBot.create(:user) }
    before(:each) do
      sign_in(user)
      get :index
    end
    it 'assigns variable :direct_friends with friends' do
      friendship = FactoryBot.create(:friendship, user: user, friend: friend, confirmed: true)
      expect(assigns(:direct_friends)).to eq([friendship])
    end

    it 'assigns :inverse_friends with other users friend' do
      friendship = FactoryBot.create(:friendship, user: friend, friend: user, confirmed: true)
      expect(assigns(:inverse_friends)).to eq([friendship])
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_template :index }
  end

  describe 'GET #create' do
    context 'with valid params' do
      let(:friend) { FactoryBot.create(:user) }
      let(:user) { FactoryBot.create(:user) }
      before(:each) do
        sign_in user
      end
      it 'creates a new friendship' do
        expect{
          get :create, params: {user_id: friend}
        }.to change(Friendship, :count).by(1)
      end
      it 'redirects to user_path' do
        get :create, params: { user_id: friend }
        expect(response).to redirect_to users_path
      end
    end
  end
end
