require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(email:"test@email.com",name:"testingtesting123")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 31
    assert_not @user.valid?
  end

  test "email shold not be too long" do
    @user.email = "s" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be valid email" do
    @user.email = "notvalid"
    assert_not @user.valid?
  end
end
