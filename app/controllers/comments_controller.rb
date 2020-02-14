class CommentsController < ApplicationController
  def new; end

  def create
    post = Post.find_by(id: params[:post_id])
    comment = post.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash.now[:success] = 'fantastic comment'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash.now[:error] = "houston, we've got a problem, please try to submit again"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
