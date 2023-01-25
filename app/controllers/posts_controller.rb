class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(created_at: :desc).limit(2)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
  end
end
