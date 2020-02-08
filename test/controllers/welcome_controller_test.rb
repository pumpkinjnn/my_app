require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get welcome_homepage_url
    assert_response :success
    assert_select "title", "Spectral by HTML5 UP"
  end

  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get generic" do
    get welcome_generic_url
    assert_response :success
  end

  test "should get elements" do
    get welcome_elements_url
    assert_response :success
  end
end
