require 'test_helper'

class ValidateUsername < ActiveSupport::TestCase
  test "should validate user w/ filled username" do
    assert users(:user_w_username_filled).valid?
  end

  test "should not validate user w/ long username" do
    assert_not users(:user_w_username_long_filled).valid?, "Username should be lower than 30 sybmols"
  end

  test "should not validate user w/ no username" do
    assert_not users(:user_w_username_not_filled).valid?, "Username should have precense"
  end
end
