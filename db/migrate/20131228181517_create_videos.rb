class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :cache_title
      t.string :cache_thumbnail_url

      t.string :youtube_id
      t.timestamps
    end
  end
end
