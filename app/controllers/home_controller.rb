class HomeController < ApplicationController
  def index
    @instagrams = Instagram.media_popular
    #binding.pry
  end
end
