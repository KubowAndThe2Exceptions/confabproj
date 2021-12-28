require "test_helper"

class SearchTest < ActiveSupport::TestCase
  setup do
    @search = searches(:one)
    @user = users(:one)
  end
  test "search_user returns users" do
    results = @search.search_user
    assert_equal(@user.id, results.first.id)
  end
end
