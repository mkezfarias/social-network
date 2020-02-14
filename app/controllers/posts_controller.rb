class PostsController < ApplicationController
  def new; end

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      flash[:success] = 'good one 😂😂😂'
      redirect_to root_path
    else
      flash[:warning] = 'your post wasnt saved, sorry, please try again, it looks like it is a good one '
      redirect_back
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
