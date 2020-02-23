require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  include WelcomeHelper

  def setup
    @base_title = " | Nannan"
    @photogtaphy = "app/assets/images/"
  end

  test "should get homepage" do
    get welcome_homepage_url
    assert_response :success
    assert_select "title", "Home#{@base_title}"
  end

  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get photography" do
    get welcome_generic_url
    assert_response :success
    assert_select "title", "Photography#{@base_title}"
  end

  test "should get elements" do
    get welcome_elements_url
    assert_response :success
    assert_select "title", "Elements#{@base_title}"
  end

  test "get_random_image gets not nil image" do
    random_image_path = get_random_image
    #put random_image_path
    assert File.exist?("#{@photogtaphy}"+ random_image_path), random_image_path
  end

end
