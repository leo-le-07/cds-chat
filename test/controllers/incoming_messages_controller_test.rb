require 'test_helper'

class IncomingMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get incoming_messages_index_url
    assert_response :success
  end

end
