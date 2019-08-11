require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(email: "te4ddst@email.com",name: "testingtesting123",
                     password: "foobar", password_confirmation: "foobar")
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
    addresses = %w[user@example,com user_at_foo.org user.name@example.
                   foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |address|
      @user.email = address
      assert_not @user.valid?
    end
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
