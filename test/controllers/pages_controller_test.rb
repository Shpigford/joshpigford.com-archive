require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get gear" do
    get pages_gear_url
    assert_response :success
  end

  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get interviews" do
    get pages_interviews_url
    assert_response :success
  end

  test "should get music" do
    get pages_music_url
    assert_response :success
  end

  test "should get now" do
    get pages_now_url
    assert_response :success
  end

  test "should get podcasts" do
    get pages_podcasts_url
    assert_response :success
  end

  test "should get reading" do
    get pages_reading_url
    assert_response :success
  end
end
