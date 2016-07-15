require 'test_helper'

class AddFriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get add_friends_index_url
    assert_response :success
  end

end
