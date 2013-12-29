class YoutubeService
  def initialize(video)
    @@client ||= YouTubeIt::Client.new
    @video     = video
  end

  def youtube_video
    @youtube_video ||= @@client.video_by(@video.youtube_id)
  end

  def title
    get_youtube_data(:title)
  end

  def thumbnail_url
    get_youtube_data(:thumbnail_url) { youtube_video.thumbnails[1].url }
  end

  def description
    get_youtube_data(:description, false)
  end

  private

  def get_youtube_data(data, must_touch_video_cache = true, &get_data)
    instance_variable = "@#{data}"

    unless instance_variable_defined?(instance_variable)
      instance_variable_set(instance_variable, get_data ? get_data.call : youtube_video.send(data.to_sym))
      touch_video_cache(data) if must_touch_video_cache
    end

    instance_variable_get(instance_variable)
  end

  def touch_video_cache(data)
    @video.send("cache_#{data}=", instance_variable_get("@#{data}"))
    @video.save!
  end
end