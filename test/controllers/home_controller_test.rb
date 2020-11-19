require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_home_url
    assert_response :success
    assert_select "title", "ヨーロッパサッカー掲示板"
  end

  test "should get help" do
    get home_help_url
    assert_response :success
    assert_select "title", "お問い合わせ"
  end
end
