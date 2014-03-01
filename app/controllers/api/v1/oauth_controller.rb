class Api::V1::OauthController < Api::BaseController
  def index
  end

  def connect
    callback_url = "http://128.199.224.228/api/v1/oauth/callback"

    redirect_to Instagram.authorize_url(:redirect_uri => callback_url)
  end

  def callback
    callback_url = "http://128.199.224.228/api/v1/oauth/callback"
    response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
    session[:access_token] = response.access_token
    redirect_to "/users/feed"
  end
end