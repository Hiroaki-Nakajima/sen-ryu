class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(8).pluck(:post_id))
    @top_rank = @all_ranks.first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  private
  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end

end
