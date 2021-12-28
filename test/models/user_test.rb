require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "user is valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "        "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "       "
    assert_not @user.valid?
  end

  test "correct_userbool works" do
    @user.correct_userbool
    assert_equal(@user.usertype, "Attendee")
    assert @user.standard, "Standard was not true"
    assert !@user.vendor, "Vendor was true or nil"
  end

  test "correct_usertype works" do
    user = User.new(name: "a_name", venue: true)
    user.correct_usertype
    assert user.venue, "venue is false"
    assert_equal("Venue", user.usertype, "usertype is not Venue")
  end
end
