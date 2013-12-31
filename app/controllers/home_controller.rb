class HomeController < ApplicationController
  PER_PAGE = 10

  def index
    @videos = Video.all.recent_first.page(params[:page]).per(PER_PAGE)
    @videos = @videos.tagged_with(params[:tag]) if params[:tag]
  end
end
