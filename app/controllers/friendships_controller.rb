class FriendshipsController < ApplicationController
  def index
    @direct_friends = current_user.friendships.where(confirmed: true, user_id: current_user.id)
    @inverse_friends = current_user.inverse_friendships.where(confirmed: true, friend_id: current_user.id)
    @sent = current_user.friendships.where(user_id: current_user.id)
    @received = current_user.inverse_friendships.where(confirmed: nil, friend_id: current_user.id)
  end

  def create
    @friend = User.find_by(id: params[:user_id])
    friendship = current_user.friendships.new(friend: @friend)
    friendship.valid?
    if @friend.id != current_user.id && friendship.save
      flash[:notice] = 'Request Submitted'
      redirect_to users_path
    else
      redirect_to friends_path
    end
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update(confirmed: true)
    redirect_to friends_path
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    redirect_to friends_path
  end
end
