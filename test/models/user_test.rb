require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test case for checking pass if all correct 
    test "some unknown error" do
    user = User.new(name: "John Doe", email: "johndoe@example.com", password: "password")
    assert user.save 
  end

  # test case for checking fail if email is missing   
  test "should not save user without email" do
    user = User.new(name: "John Doe", password: "password")
    assert_not user.save 
  end
  
  # test case for checking fail if password is missing   
  test "should not save user without password" do
    user = User.new(name: "John Doe", email: "johndoe@example.com")
    assert_not user.save 
  end


end
