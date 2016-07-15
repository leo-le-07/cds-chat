require 'test_helper'

class SentMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sent_messages_index_url
    assert_response :success
  end

  test "should get new" do
    get sent_messages_new_url
    assert_response :success
  end

  test "should get create" do
    get sent_messages_create_url
    assert_response :success
  end

end
