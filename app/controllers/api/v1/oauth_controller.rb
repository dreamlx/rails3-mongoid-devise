class Api::V1::OauthController < Api::BaseController
  def index
  end

  def connect
    callback_url = "http://test.videoshowapp.com/oauth/callback"

    redirect_to Instagram.authorize_url(:redirect_uri => callback_url)
  end

  def callback
    callback_url = "http://test.videoshowapp.com/oauth/callback"
    response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
    session[:access_token] = response.access_token
    redirect "/users/feed"
  end
end