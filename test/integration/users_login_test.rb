require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:kehlar)
  end

  test "login and flash/invalid password" do
    get sessions_new_url
    assert_template "sessions/new"
    post sessions_new_url, params: { sessions: { email: @user.email, password: "invalid" } }
    assert_not is_logged_in?
    assert_template "sessions/new"
    get root
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get sessions_new_url
    post sessions_new_url, params: { session: { email: @user.email,
                                               password: "password" } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
