class UsersController < ApplicationController
  def show
    @posts = current_user.posts
    @user = User.find(params[:id])
    all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @my_ranks = all_ranks.select{ |note| note.user_id == current_user.id }
    @user_ranks = all_ranks.select{ |note| note.user_id == @user.id }
  end
end
