class PagesController < ApplicationController

  def feed
    @friendships = current_user.friendships.select{|friendship| friendship.friend.id if friendship.confirmed} +
                    current_user.inverse_friendships.select{ |friendship| friendship.user.id if friendship.confirmed}
    @posts = Post.where("user_id IN (:ids)", ids: @friendships + [current_user.id]).order(created_at: :desc)
    @post = Post.new
  end

end
