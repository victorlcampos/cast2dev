class HomeController < ApplicationController
  def index
    @videos = Video.all.recent_first
  end
end
