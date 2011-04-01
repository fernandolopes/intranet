require 'test_helper'

class Frequencia::OrgaosControllerTest < ActionController::TestCase
  setup do
    @frequencia_orgao = frequencia_orgaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencia_orgaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequencia_orgao" do
    assert_difference('Frequencia::Orgao.count') do
      post :create, :frequencia_orgao => @frequencia_orgao.attributes
    end

    assert_redirected_to frequencia_orgao_path(assigns(:frequencia_orgao))
  end

  test "should show frequencia_orgao" do
    get :show, :id => @frequencia_orgao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frequencia_orgao.to_param
    assert_response :success
  end

  test "should update frequencia_orgao" do
    put :update, :id => @frequencia_orgao.to_param, :frequencia_orgao => @frequencia_orgao.attributes
    assert_redirected_to frequencia_orgao_path(assigns(:frequencia_orgao))
  end

  test "should destroy frequencia_orgao" do
    assert_difference('Frequencia::Orgao.count', -1) do
      delete :destroy, :id => @frequencia_orgao.to_param
    end

    assert_redirected_to frequencia_orgaos_path
  end
end
