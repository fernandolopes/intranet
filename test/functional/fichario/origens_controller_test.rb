require 'test_helper'

class Fichario::OrigensControllerTest < ActionController::TestCase
  setup do
    @fichario_origem = fichario_origens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fichario_origens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fichario_origem" do
    assert_difference('Fichario::Origem.count') do
      post :create, :fichario_origem => @fichario_origem.attributes
    end

    assert_redirected_to fichario_origem_path(assigns(:fichario_origem))
  end

  test "should show fichario_origem" do
    get :show, :id => @fichario_origem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fichario_origem.to_param
    assert_response :success
  end

  test "should update fichario_origem" do
    put :update, :id => @fichario_origem.to_param, :fichario_origem => @fichario_origem.attributes
    assert_redirected_to fichario_origem_path(assigns(:fichario_origem))
  end

  test "should destroy fichario_origem" do
    assert_difference('Fichario::Origem.count', -1) do
      delete :destroy, :id => @fichario_origem.to_param
    end

    assert_redirected_to fichario_origens_path
  end
end
