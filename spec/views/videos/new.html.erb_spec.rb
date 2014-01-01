require 'spec_helper'

describe "videos/new" do
  context 'form' do
    before(:each) do
      assign(:video, Video.new)
      render
    end

    it 'should render new_video form' do
      assert_select('#new_video') do
        assert_select 'input[name=?]', 'video[youtube_id]'
        assert_select 'input[name=?]', 'video[tag_list]'
      end
    end
  end
end
