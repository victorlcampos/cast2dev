class HomeController < ApplicationController
  def index
    @videos = Video.all.recent_first
    @videos = @videos.tagged_with(params[:tag]) if params[:tag]
  end
end
