require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_template 'static_pages/contact'
    assert_select "title", full_title("Contact")
    get help_path
    assert_template 'static_pages/help'
    assert_select "title", full_title("Help")
    get about_path
    assert_template 'static_pages/about'
    assert_select "title", full_title("About")
    get signup_path
    assert_template 'users/new'
    assert_select "title", full_title("Sign up")

  end
end