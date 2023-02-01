class PostsController < ApplicationController
  def index
    Rails.logger.info(params[:user_id])
    @posts = Post.includes(:author,
                           comments: [:author]).where(author_id: params[:user_id]).order(created_at: :desc).limit(2)
    @first_post = @posts[0]
    @posts.each do |post|
      Rails.logger.info(post.title || 'No title')
      Rails.logger.info(post.text || 'No text')
    end

    Rails.logger.info(@first_post.author.name || 'No name')
  end

  def show
    @post = Post.includes(:author, comments: [:author]).where(author_id: params[:user_id]).find(params[:id])
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
