class LikesController < ApplicationController
  def create
    like_params = params.require(:new_like).permit(:post_id)
    like = Like.new(like_params)
    like.author = current_user
    like.post = Post.find(like_params[:post_id])
    respond_to do |format|
      format.html do
        if like.save
          flash.now[:notice] = 'Like created successfully'
        else
          flash.now[:alert] = 'Like creation failed'
        end
        redirect_to user_post_path(like.post.author_id, like.post.id)
      end
    end
  end
end
