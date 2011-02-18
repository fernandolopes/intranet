require 'test_helper'

class Fichario::AndamentosControllerTest < ActionController::TestCase
  setup do
    @fichario_andamento = fichario_andamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fichario_andamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fichario_andamento" do
    assert_difference('Fichario::Andamento.count') do
      post :create, :fichario_andamento => @fichario_andamento.attributes
    end

    assert_redirected_to fichario_andamento_path(assigns(:fichario_andamento))
  end

  test "should show fichario_andamento" do
    get :show, :id => @fichario_andamento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fichario_andamento.to_param
    assert_response :success
  end

  test "should update fichario_andamento" do
    put :update, :id => @fichario_andamento.to_param, :fichario_andamento => @fichario_andamento.attributes
    assert_redirected_to fichario_andamento_path(assigns(:fichario_andamento))
  end

  test "should destroy fichario_andamento" do
    assert_difference('Fichario::Andamento.count', -1) do
      delete :destroy, :id => @fichario_andamento.to_param
    end

    assert_redirected_to fichario_andamentos_path
  end
end
