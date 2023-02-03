class Api::V1::PostsController < ApiController
    def index
      Rails.logger.info(params[:id])
      @user = User.find(params[:user_id])
    end
  end