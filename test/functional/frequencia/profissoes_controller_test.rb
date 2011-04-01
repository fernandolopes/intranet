require 'test_helper'

class Frequencia::ProfissoesControllerTest < ActionController::TestCase
  setup do
    @frequencia_profissao = frequencia_profissoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencia_profissoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequencia_profissao" do
    assert_difference('Frequencia::Profissao.count') do
      post :create, :frequencia_profissao => @frequencia_profissao.attributes
    end

    assert_redirected_to frequencia_profissao_path(assigns(:frequencia_profissao))
  end

  test "should show frequencia_profissao" do
    get :show, :id => @frequencia_profissao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frequencia_profissao.to_param
    assert_response :success
  end

  test "should update frequencia_profissao" do
    put :update, :id => @frequencia_profissao.to_param, :frequencia_profissao => @frequencia_profissao.attributes
    assert_redirected_to frequencia_profissao_path(assigns(:frequencia_profissao))
  end

  test "should destroy frequencia_profissao" do
    assert_difference('Frequencia::Profissao.count', -1) do
      delete :destroy, :id => @frequencia_profissao.to_param
    end

    assert_redirected_to frequencia_profissoes_path
  end
end
