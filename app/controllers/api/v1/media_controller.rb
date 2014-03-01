class Api::V1::MediaController < Api::BaseController
  def popular
    instagrams = Instagram.media_popular
    render json: instagrams.to_json
  end

  def tag_search
    # tag_search
    instagrams = Instagram.media_tag_search
    render json: instagrams.to_json
  end
end