class LikesController < ApplicationController
  def create
    like = Like.new
    if params[:post_id]
      post = Post.find_by(id: params[:post_id])
      like.likeable = post
    elsif params[:comment_id]
      comment = Comment.find_by(id: params[:comment_id])
      like.likeable = comment
    end
    like.user_id = current_user.id
    like.save

    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find_by(id: params[:id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
