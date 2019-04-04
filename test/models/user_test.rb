require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "xujun",email: "xujun@shanon-cn.com", password: "xujun123", password_confirmation: "xujun123")
  end

  test "valid user" do
  	assert @user.valid?
  end

  test "empty test" do
  	@user.name = " "
  	assert_not @user.valid?
  	@user.email = " "
  	assert_not @user.valid?
  end

  test "length over test" do
  	@user.name = "my long user nmae over 20 charaters"
  	assert_not @user.valid?
  end

  test "email format test" do
  	valid_address = %w[a@b.c xujun@shanon.com]
  	valid_address.each do |addr|
  		@user.email = addr
  		assert @user.valid?
  	end
  	@user.email = "a@b"
  	assert_not @user.valid?
  end

  test "emial unique" do
  	duplicate_user = @user.dup
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "emial downcase" do
  	mixed_case_email= 'XuJun@shanon-cn.com'
  	@user.email = mixed_case_email
  	@user.save
  	assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "pswd exist" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "pswd length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
