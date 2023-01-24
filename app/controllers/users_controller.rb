class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @top_three_posts = top_three_posts_for_user(@user)
  end

  def top_three_posts_for_user(user)
    @posts = Post.where(author_id: user.id).order('created_at DESC').limit(3)
  end
end
