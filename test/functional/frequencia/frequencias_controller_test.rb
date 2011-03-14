require 'test_helper'

class Frequencia::FrequenciasControllerTest < ActionController::TestCase
  setup do
    @frequencia_frequencia = frequencia_frequencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencia_frequencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequencia_frequencia" do
    assert_difference('Frequencia::Frequencia.count') do
      post :create, :frequencia_frequencia => @frequencia_frequencia.attributes
    end

    assert_redirected_to frequencia_frequencia_path(assigns(:frequencia_frequencia))
  end

  test "should show frequencia_frequencia" do
    get :show, :id => @frequencia_frequencia.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frequencia_frequencia.to_param
    assert_response :success
  end

  test "should update frequencia_frequencia" do
    put :update, :id => @frequencia_frequencia.to_param, :frequencia_frequencia => @frequencia_frequencia.attributes
    assert_redirected_to frequencia_frequencia_path(assigns(:frequencia_frequencia))
  end

  test "should destroy frequencia_frequencia" do
    assert_difference('Frequencia::Frequencia.count', -1) do
      delete :destroy, :id => @frequencia_frequencia.to_param
    end

    assert_redirected_to frequencia_frequencias_path
  end
end
