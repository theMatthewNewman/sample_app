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
end
