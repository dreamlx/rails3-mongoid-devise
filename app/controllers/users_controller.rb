class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
    render json: @user.to_json
  end

end
