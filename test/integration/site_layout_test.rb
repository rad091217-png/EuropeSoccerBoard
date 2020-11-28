require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root
    assert_template "home/top"
    assert_select "a[href=?]", root
    assert_select "a[href=?]", help
    assert_select "a[href=?]", liga
    assert_select "a[href=?]", bundesu
    assert_select "a[href=?]", premier
    assert_select "a[href=?]", serie
    assert_select "a[href=?]", league_one
    assert_select "a[href=?]", premera
    assert_select "a[href=?]", euro
    assert_select "a[href=?]", nations_league
  end
end
