require 'test_helper'

class AssuntosControllerTest < ActionController::TestCase
  setup do
    @assunto = assuntos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assuntos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assunto" do
    assert_difference('Assunto.count') do
      post :create, :assunto => @assunto.attributes
    end

    assert_redirected_to assunto_path(assigns(:assunto))
  end

  test "should show assunto" do
    get :show, :id => @assunto.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @assunto.to_param
    assert_response :success
  end

  test "should update assunto" do
    put :update, :id => @assunto.to_param, :assunto => @assunto.attributes
    assert_redirected_to assunto_path(assigns(:assunto))
  end

  test "should destroy assunto" do
    assert_difference('Assunto.count', -1) do
      delete :destroy, :id => @assunto.to_param
    end

    assert_redirected_to assuntos_path
  end
end
