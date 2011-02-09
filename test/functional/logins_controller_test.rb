require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  setup do
    @login = logins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create login" do
    assert_difference('Login.count') do
      post :create, :login => @login.attributes
    end

    assert_redirected_to login_path(assigns(:login))
  end

  test "should show login" do
    get :show, :id => @login.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @login.to_param
    assert_response :success
  end

  test "should update login" do
    put :update, :id => @login.to_param, :login => @login.attributes
    assert_redirected_to login_path(assigns(:login))
  end

  test "should destroy login" do
    assert_difference('Login.count', -1) do
      delete :destroy, :id => @login.to_param
    end

    assert_redirected_to logins_path
  end
end
