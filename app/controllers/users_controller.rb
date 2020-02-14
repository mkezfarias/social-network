class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  def index
    friendships = current_user
      .friendships.where(user_id: current_user.id).map(&:friend) + current_user
      .inverse_friendships.where(friend_id: current_user.id).map(&:user) + [current_user]
    @users = User.all - friendships
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    redirect_to new_user_session_path
  end
end
