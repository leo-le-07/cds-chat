require 'test_helper'

class FriendBlocksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friend_blocks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get friend_blocks_destroy_url
    assert_response :success
  end

end
