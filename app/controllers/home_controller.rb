class HomeController < ApplicationController
  PER_PAGE = 10

  def index
    @search = Sunspot.search(Video) do
      fulltext params[:search]
    end
      @videos = Video.all.recent_first.page(params[:page]).per(PER_PAGE)
      @videos = @videos.tagged_with(params[:tag]) if params[:tag]
      @videos = @search.results unless params[:search].nil?
  end

  end
