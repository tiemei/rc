require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should verify user's validations" do
    params_wrong = {email: 'worong_format_email',
                    name: nil,
                    pwd: 'wrong_format_pwd1'}
    user = User.new(params_wrong)
    user.save
    assert_equal 'Wrong email addr', user.errors[:email][0]
    assert_not_nil user.errors[:name]
    assert_not_nil user.errors[:pwd]
    user.errors.clear
    
    params_right = {email: 'ninoi_ni@sina.com',
                    name: 'test_name',
                    pwd: 'correctpwd?'}
    user = User.create(params_right)
    assert_not_nil user.id

    user = User.new(params_right)
    assert !user.save
  end

  test "contact relationship judge" do
    assert users(:one).contact?(users(:three))
    assert users(:one).contact?(users(:three).id)
    assert users(:three).contacted_by?(users(:one))
    assert users(:three).contacted_by?(users(:one).id)
  end
end
