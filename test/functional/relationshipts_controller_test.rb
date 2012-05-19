require 'test_helper'

class RelationshiptsControllerTest < ActionController::TestCase
  def setup
    @request.env['HTTP_REFERER'] = 'http://test.host/home/index'
  end

  test "should contact other" do
    session[:current_user_id] = users(:one).id
    get :contact, to_id: users(:two).id
    assert_redirected_to :back
  end
  
  test "should cancle contact other" do
    session[:current_user_id] = users(:one).id
    get :contact, to_id: users(:two).id
    assert_redirected_to :back
  end

end
