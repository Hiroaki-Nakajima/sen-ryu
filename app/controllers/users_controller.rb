class UsersController < ApplicationController
  def show
    @posts = current_user.posts
    @user = User.find(params[:id])
    @user_posts = @user.posts.order("created_at DESC")

    all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    @my_ranks = all_ranks.select{ |post| post.user_id == current_user.id }
    @user_ranks = all_ranks.select{ |post| post.user_id == @user.id }
    @top_rank = @user_ranks.first
  end

  def edit
  end

  def update
  end

  def detroy
  end
  
end
