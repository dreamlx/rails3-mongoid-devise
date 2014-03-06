class Api::V1::OauthController < Api::BaseController
  CALLBACK = "http://test.videoshowapp.com:8087/api/v1/oauth/callback"
  def index
  end

  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK)
    session[:access_token] = response.access_token
    redirect_to feed_users_path
  end

end