require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_signup_url
    assert_response :success
  end
end
