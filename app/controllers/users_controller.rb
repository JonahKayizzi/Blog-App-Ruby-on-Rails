class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
