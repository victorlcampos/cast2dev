class VideosController < ApplicationController
  def show
    @video = Video.find_by_params(params[:id])
    @youtube_service = @video.youtube_service
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params.require(:video).permit(:youtube_id, :tag_list))

    if @video.save
      redirect_to video_path(@video)
    else
      render :new and return
    end
  end
end
