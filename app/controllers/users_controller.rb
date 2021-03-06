class UsersController < ApplicationController
  #before_filter :authenticate_user!  
  def index
    @users = User.all
  end

  def profile
    client = Instagram.client(:access_token => session[:access_token])
    user = client.user
    render json: user.to_json
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    @medias = client.user_recent_media(:count => 20)
    @user = client.user
    respond_to do |format|
      format.html
      format.json { 
        render json: {media: @medias.to_json}
      }
    end
  end


end
