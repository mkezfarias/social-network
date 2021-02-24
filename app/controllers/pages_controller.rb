class PagesController < ApplicationController
  def feed
    @friendships = current_user.friendships.map { |friendship| friendship.friend.id if friendship.confirmed }.compact +
                   current_user.inverse_friendships.map do |friendship|
                     friendship.user.id if friendship.confirmed
                   end .compact
    @posts = Post.where('user_id IN (:ids)', ids: @friendships + [current_user.id]).order(created_at: :desc)
    @post = Post.new
  end
end
