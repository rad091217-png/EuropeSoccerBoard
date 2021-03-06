require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ExampleUser)
    @another_user = users(:kouei)
  end

  test "should get signup" do
    get signup_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in as as another user" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in as another user" do
    patch user_path(@user), params: { user: { name: @user.name,
                                             email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@another_user)
    assert_not @another_user.admin?
    patch user_path(@another_user), params: {
                                      user: { password: "password",
                                              password_confirmation: "password",
                                              admin: true },
                                    }
    assert_not @another_user.reload.admin?
  end
end
