require 'test_helper'

class ConversationEmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get conversation_emails_new_url
    assert_response :success
  end

  test "should get create" do
    get conversation_emails_create_url
    assert_response :success
  end

end
