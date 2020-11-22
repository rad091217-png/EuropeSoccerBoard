require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_home_url
    assert_response :success
    assert_select "title", "ヨーロッパサッカー掲示板"
  end

  test "should get liga" do
    get home_liga_url
    assert_response :success
    assert_select "title", "ラ・リーガ"
  end

  test "should get bundesu" do
    get home_bundesu_url
    assert_response :success
    assert_select "title", "ブンデスリーガ"
  end

  test "should get premier" do
    get home_premier_url
    assert_response :success
    assert_select "title", "プレミアリーグ"
  end

  test "should get serie" do
    get home_serie_url
    assert_response :success
    assert_select "title", "セリエA"
  end

  test "should get league_one" do
    get home_league_one_url
    assert_response :success
    assert_select "title", "リーグアン"
  end

  test "should get premera" do
    get home_premera_url
    assert_response :success
    assert_select "title", "プリメーラリーガ"
  end

  test "should get euro" do
    get home_euro_url
    assert_response :success
    assert_select "title", "UEFAユーロ"
  end

  test "should get nations_league" do
    get home_nations_league_url
    assert_response :success
    assert_select "title", "ネーションズリーグ"
  end

  test "should get help" do
    get home_help_url
    assert_response :success
    assert_select "title", "要望、お問い合わせ"
  end
end
