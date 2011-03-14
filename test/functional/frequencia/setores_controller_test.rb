require 'test_helper'

class Frequencia::SetoresControllerTest < ActionController::TestCase
  setup do
    @frequencia_setor = frequencia_setores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencia_setores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequencia_setor" do
    assert_difference('Frequencia::Setor.count') do
      post :create, :frequencia_setor => @frequencia_setor.attributes
    end

    assert_redirected_to frequencia_setor_path(assigns(:frequencia_setor))
  end

  test "should show frequencia_setor" do
    get :show, :id => @frequencia_setor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frequencia_setor.to_param
    assert_response :success
  end

  test "should update frequencia_setor" do
    put :update, :id => @frequencia_setor.to_param, :frequencia_setor => @frequencia_setor.attributes
    assert_redirected_to frequencia_setor_path(assigns(:frequencia_setor))
  end

  test "should destroy frequencia_setor" do
    assert_difference('Frequencia::Setor.count', -1) do
      delete :destroy, :id => @frequencia_setor.to_param
    end

    assert_redirected_to frequencia_setores_path
  end
end
