require 'test_helper'

class ValidateUsername < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "example@example.ru", password: "123456")
  end

  test "Should not save user w/o username" do
    @user.username = ""

    assert_not @user.save, "Username user should presence"
  end

  test "Should not save user w/ long name" do
    @user.username = "x" * 31

    assert_not @user.save, "Username length should be < 30"
  end

  test "Should save user w/ correct name" do
    @user.username = "Tom Marvolo Riddle"

    assert @user.save
  end 
end
