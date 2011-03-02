require 'test_helper'

class Fichario::AndamentoFichasControllerTest < ActionController::TestCase
  setup do
    @fichario_andamento_ficha = fichario_andamento_fichas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fichario_andamento_fichas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fichario_andamento_ficha" do
    assert_difference('Fichario::AndamentoFicha.count') do
      post :create, :fichario_andamento_ficha => @fichario_andamento_ficha.attributes
    end

    assert_redirected_to fichario_andamento_ficha_path(assigns(:fichario_andamento_ficha))
  end

  test "should show fichario_andamento_ficha" do
    get :show, :id => @fichario_andamento_ficha.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fichario_andamento_ficha.to_param
    assert_response :success
  end

  test "should update fichario_andamento_ficha" do
    put :update, :id => @fichario_andamento_ficha.to_param, :fichario_andamento_ficha => @fichario_andamento_ficha.attributes
    assert_redirected_to fichario_andamento_ficha_path(assigns(:fichario_andamento_ficha))
  end

  test "should destroy fichario_andamento_ficha" do
    assert_difference('Fichario::AndamentoFicha.count', -1) do
      delete :destroy, :id => @fichario_andamento_ficha.to_param
    end

    assert_redirected_to fichario_andamento_fichas_path
  end
end
