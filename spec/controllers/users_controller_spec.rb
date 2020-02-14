require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    context 'with logged in user' do
      let(:user) { FactoryBot.create(:user) }
      before(:each) do
        sign_in user
        get :show, params: { id: user }
      end
      it { is_expected.to respond_with :ok }
      it 'assigns a user to :user' do
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'without signed in user' do
      before(:each) do
        get :show, params: { id: 1 }
      end
      it { is_expected.to respond_with 302 }
    end
  end
end
