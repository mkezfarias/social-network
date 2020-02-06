class PagesController < ApplicationController

  def feed
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

end
