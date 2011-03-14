require 'test_helper'

class Frequencia::JustificativasControllerTest < ActionController::TestCase
  setup do
    @frequencia_justificativa = frequencia_justificativas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencia_justificativas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequencia_justificativa" do
    assert_difference('Frequencia::Justificativa.count') do
      post :create, :frequencia_justificativa => @frequencia_justificativa.attributes
    end

    assert_redirected_to frequencia_justificativa_path(assigns(:frequencia_justificativa))
  end

  test "should show frequencia_justificativa" do
    get :show, :id => @frequencia_justificativa.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frequencia_justificativa.to_param
    assert_response :success
  end

  test "should update frequencia_justificativa" do
    put :update, :id => @frequencia_justificativa.to_param, :frequencia_justificativa => @frequencia_justificativa.attributes
    assert_redirected_to frequencia_justificativa_path(assigns(:frequencia_justificativa))
  end

  test "should destroy frequencia_justificativa" do
    assert_difference('Frequencia::Justificativa.count', -1) do
      delete :destroy, :id => @frequencia_justificativa.to_param
    end

    assert_redirected_to frequencia_justificativas_path
  end
end
