require "test_helper"

class NftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nfts_index_url
    assert_response :success
  end

  test "should get show" do
    get nfts_show_url
    assert_response :success
  end
end
