class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
    post = Post.find(params[:post_id])
    post.create_notification_comment!(current_user, comment.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/posts/#{comment.post.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

