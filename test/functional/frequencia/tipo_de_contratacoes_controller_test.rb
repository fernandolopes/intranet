require 'test_helper'

class Frequencia::TipoDeContratacoesControllerTest < ActionController::TestCase
  setup do
    @frequencia_tipo_de_contratacao = frequencia_tipo_de_contratacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencia_tipo_de_contratacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequencia_tipo_de_contratacao" do
    assert_difference('Frequencia::TipoDeContratacao.count') do
      post :create, :frequencia_tipo_de_contratacao => @frequencia_tipo_de_contratacao.attributes
    end

    assert_redirected_to frequencia_tipo_de_contratacao_path(assigns(:frequencia_tipo_de_contratacao))
  end

  test "should show frequencia_tipo_de_contratacao" do
    get :show, :id => @frequencia_tipo_de_contratacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frequencia_tipo_de_contratacao.to_param
    assert_response :success
  end

  test "should update frequencia_tipo_de_contratacao" do
    put :update, :id => @frequencia_tipo_de_contratacao.to_param, :frequencia_tipo_de_contratacao => @frequencia_tipo_de_contratacao.attributes
    assert_redirected_to frequencia_tipo_de_contratacao_path(assigns(:frequencia_tipo_de_contratacao))
  end

  test "should destroy frequencia_tipo_de_contratacao" do
    assert_difference('Frequencia::TipoDeContratacao.count', -1) do
      delete :destroy, :id => @frequencia_tipo_de_contratacao.to_param
    end

    assert_redirected_to frequencia_tipo_de_contratacoes_path
  end
end
