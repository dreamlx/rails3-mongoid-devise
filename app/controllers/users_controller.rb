class UsersController < ApplicationController
  #before_filter :authenticate_user!
  
  #TOKEN = '789981918.80d957c.f408bb1006844250907d9d2a34df66c4'
  def index
    @users = User.all
  end

  def profile
    TOKEN = session[:access_token]
    client = Instagram.client(:access_token => TOKEN)
    user = client.user
    render json: user.to_json
  end

  def feed
    TOKEN = session[:access_token]
    client = Instagram.client(:access_token => TOKEN)
    @medias = client.user_recent_media(:count => 20)
    @user = client.user
    respond_to do |format|
      format.html
      format.json { render json: @medias.to_json }
    end
  end


end
