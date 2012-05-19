require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    assert_response :success

    assert_not_nil assigns(:hot_products)
    assert_not_nil assigns(:new_products)

    assert_template 'index'

    assert_select '#main'
  end

  test "should get personal index" do
    session[:current_user_id] = users(:one).id
    get :person_index , index_type: 1,  page: 1, id: users(:one).id
    assert_not_nil assigns(:user)
    assert_template 'person_index'
    assert_not_nil assigns(:posts)
  
    get :person_index, index_type: 2, page: 1
    assert_not_nil assigns(:user)
    assert_not_nil assigns(:posts)
    assert_template 'person_index'
  end
  
end
