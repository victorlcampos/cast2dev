class YoutubeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      record.youtube_service.youtube_video
    rescue
      record.errors[attribute] << (options[:message] || "id inválido")
    end
  end
end


class Video < ActiveRecord::Base
  belongs_to :category
  acts_as_taggable

  scope :recent_first, -> { order('created_at DESC') }

  validates :youtube_id, presence: true, uniqueness: true, youtube: true

  searchable do
    text :cache_title
  end

  def self.find_by_params(params)
    find_by(youtube_id: params)
  end

  def to_param
    youtube_id
  end

  def youtube_service
    @youtube_service ||= YoutubeService.new(self)
  end

  def title
    cache_title?         ? cache_title         : youtube_service.title
  end

  def thumbnail_url
    cache_thumbnail_url? ? cache_thumbnail_url : youtube_service.thumbnail_url
  end

  def description
    youtube_service.description
  end

  private

  def exist_in_youtube
    begin
      youtube_service.youtube_video
    rescue
      errors.add(:youtube_id, 'inválido')
    end
  end
end
