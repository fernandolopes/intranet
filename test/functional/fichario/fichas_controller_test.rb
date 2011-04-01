require 'test_helper'

class Fichario::FichasControllerTest < ActionController::TestCase
  setup do
    @fichario_ficha = fichario_fichas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fichario_fichas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fichario_ficha" do
    assert_difference('Fichario::Ficha.count') do
      post :create, :fichario_ficha => @fichario_ficha.attributes
    end

    assert_redirected_to fichario_ficha_path(assigns(:fichario_ficha))
  end

  test "should show fichario_ficha" do
    get :show, :id => @fichario_ficha.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fichario_ficha.to_param
    assert_response :success
  end

  test "should update fichario_ficha" do
    put :update, :id => @fichario_ficha.to_param, :fichario_ficha => @fichario_ficha.attributes
    assert_redirected_to fichario_ficha_path(assigns(:fichario_ficha))
  end

  test "should destroy fichario_ficha" do
    assert_difference('Fichario::Ficha.count', -1) do
      delete :destroy, :id => @fichario_ficha.to_param
    end

    assert_redirected_to fichario_fichas_path
  end
end
