class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
