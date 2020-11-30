require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "ヨーロッパサッカー掲示板"
  end

  test "should get liga" do
    get liga_path
    assert_response :success
    assert_select "title", "ラ・リーガ"
  end

  test "should get bundesu" do
    get bundesu_path
    assert_response :success
    assert_select "title", "ブンデスリーガ"
  end

  test "should get premier" do
    get premier_path
    assert_response :success
    assert_select "title", "プレミアリーグ"
  end

  test "should get serie" do
    get serie_path
    assert_response :success
    assert_select "title", "セリエA"
  end

  test "should get league_one" do
    get league_one_path
    assert_response :success
    assert_select "title", "リーグアン"
  end

  test "should get premera" do
    get premera_path
    assert_response :success
    assert_select "title", "プリメーラリーガ"
  end

  test "should get euro" do
    get euro_path
    assert_response :success
    assert_select "title", "UEFAユーロ"
  end

  test "should get nations_league" do
    get nations_league_path
    assert_response :success
    assert_select "title", "ネーションズリーグ"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "要望、お問い合わせ"
  end
end
