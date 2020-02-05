class FriendshipsController < ApplicationController

  def index
    @friendships = current_user.friendships.where(confirmed: true) + current_user.inverse_friendships.where(confirmed: true)
    @sent = current_user.friendships
    @received = current_user.inverse_friendships.where(confirmed: nil)
  end

  def create
    @friend = User.find_by(id: params[:user_id])
    friendship = current_user.friendships.new(friend: @friend)
    if friendship.save
      redirect_to root_path
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
