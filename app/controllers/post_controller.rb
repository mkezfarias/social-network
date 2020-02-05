class PostController < ApplicationController
  def new; end

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end
end
