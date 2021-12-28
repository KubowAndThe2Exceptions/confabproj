require "test_helper"

class SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search = searches(:one)
  end

  test "should get new" do
    get new_search_url
    assert_response :success
  end

  test "should create search" do
    assert_difference('Search.count') do
      post searches_url, params: { search: { search_input: @search.search_input, usertype: @search.usertype } }
    end
    assert_redirected_to search_url(Search.last)
  end

  test "should show search" do
    get search_url(@search)
    assert_response :success
  end
end