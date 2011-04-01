require 'test_helper'

class Fichario::AssuntosControllerTest < ActionController::TestCase
  setup do
    @fichario_assunto = fichario_assuntos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fichario_assuntos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fichario_assunto" do
    assert_difference('Fichario::Assunto.count') do
      post :create, :fichario_assunto => @fichario_assunto.attributes
    end

    assert_redirected_to fichario_assunto_path(assigns(:fichario_assunto))
  end

  test "should show fichario_assunto" do
    get :show, :id => @fichario_assunto.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fichario_assunto.to_param
    assert_response :success
  end

  test "should update fichario_assunto" do
    put :update, :id => @fichario_assunto.to_param, :fichario_assunto => @fichario_assunto.attributes
    assert_redirected_to fichario_assunto_path(assigns(:fichario_assunto))
  end

  test "should destroy fichario_assunto" do
    assert_difference('Fichario::Assunto.count', -1) do
      delete :destroy, :id => @fichario_assunto.to_param
    end

    assert_redirected_to fichario_assuntos_path
  end
end
