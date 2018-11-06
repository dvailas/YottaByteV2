require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get sale" do
    get search_sale_url
    assert_response :success
  end

  test "should get result" do
    get search_result_url
    assert_response :success
  end

  test "should get recent" do
    get search_recent_url
    assert_response :success
  end

end
