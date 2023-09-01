require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post messages_create_url, params: { number: 5 }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
