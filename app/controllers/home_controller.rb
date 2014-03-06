class HomeController < ApplicationController
  def index
    @instagrams = Instagram.media_popular
  end
end
