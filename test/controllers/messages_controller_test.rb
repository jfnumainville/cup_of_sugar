require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get messages_create_url
    assert_response :success
  end

  test "should get message_params" do
    get messages_message_params_url
    assert_response :success
  end
end
