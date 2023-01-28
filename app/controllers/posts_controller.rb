class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(created_at: :desc).limit(2)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
    comment = Comment.new
    like = Like.new
    respond_to do |format|
      format.html { render :show, locals: { comment: comment, like: like } }
    end
  end

  def new
    new_post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: new_post } }
    end
  end

  def create
    post_params = params.require(:new_post).permit(:title, :text)
    post = Post.new(post_params)
    post.author = current_user
    post.comments_counter = 0
    post.likes_counter = 0
    respond_to do |format|
      format.html do
        if post.save
          flash[:notice] = 'Post created successfully'
          redirect_to users_path
        else
          Rails.logger.error(post.errors.full_messages)
          flash.now[:alert] = 'Post creation failed'
          render :new, locals: { post: post }
        end
      end
    end
  end
end
