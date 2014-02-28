class Api::V1::MediaController < Api::BaseController
  def popular
    instagrams = Instagram.media_popular
    render json: instagrams.to_json
  end
end