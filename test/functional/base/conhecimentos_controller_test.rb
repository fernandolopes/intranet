require 'test_helper'

class Base::ConhecimentosControllerTest < ActionController::TestCase
  setup do
    @base_conhecimento = base_conhecimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_conhecimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_conhecimento" do
    assert_difference('Base::Conhecimento.count') do
      post :create, :base_conhecimento => @base_conhecimento.attributes
    end

    assert_redirected_to base_conhecimento_path(assigns(:base_conhecimento))
  end

  test "should show base_conhecimento" do
    get :show, :id => @base_conhecimento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @base_conhecimento.to_param
    assert_response :success
  end

  test "should update base_conhecimento" do
    put :update, :id => @base_conhecimento.to_param, :base_conhecimento => @base_conhecimento.attributes
    assert_redirected_to base_conhecimento_path(assigns(:base_conhecimento))
  end

  test "should destroy base_conhecimento" do
    assert_difference('Base::Conhecimento.count', -1) do
      delete :destroy, :id => @base_conhecimento.to_param
    end

    assert_redirected_to base_conhecimentos_path
  end
end
