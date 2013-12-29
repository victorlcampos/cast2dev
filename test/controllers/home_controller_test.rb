require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "assign all videos" do
    assert_select '#videos' do

    end
  end
end
