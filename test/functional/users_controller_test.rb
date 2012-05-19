require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end


  test "should get login when session/cookie setted or not setted" do
    get :login
    assert_template :login

    cookies[:user_id] = @user.id
    get :login
    assert_redirected_to '/home/index'
    assert_not_nil session[:current_user_id]
    assert_not_nil session[:current_user_name]

    session[:current_user_id] = @user.id
    get :login
    assert_redirected_to '/home/index'
  end

  test "should auth correctly" do
    @request.env['HTTP_REFERER'] = 'http://test.host/home/index'

    p = {name: 'tiemei', pwd: 'myrc?2010'}
    post :auth, p
    assert_not_nil session[:current_user_id]
    assert_not_nil session[:current_user_name]
    assert_redirected_to '/home/index'
    assert_nil cookies[:user_id]

    p[:remember] = '1'

    post :auth, p
    assert_redirected_to '/home/index'
    assert_not_nil session[:current_user_id]
    assert_not_nil session[:current_user_name]
    assert_equal @user.id , cookies[:user_id]
  end
  
  test 'should logout to remove cookies and session' do
    get :logout
    assert_nil session[:current_user_id]
    assert_nil session[:current_user_name]
    assert_nil cookies[:user_id]
    assert_redirected_to '/login'
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count', 0) do
      post :create, user: { email: @user.email, name: @user.name, pwd: @user.pwd }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { email: @user.email, name: @user.name, pwd: @user.pwd }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
