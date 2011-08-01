require 'test_helper'

class InteracoesControllerTest < ActionController::TestCase
  setup do
    @interacao = interacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interacao" do
    assert_difference('Interacao.count') do
      post :create, :interacao => @interacao.attributes
    end

    assert_redirected_to interacao_path(assigns(:interacao))
  end

  test "should show interacao" do
    get :show, :id => @interacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @interacao.to_param
    assert_response :success
  end

  test "should update interacao" do
    put :update, :id => @interacao.to_param, :interacao => @interacao.attributes
    assert_redirected_to interacao_path(assigns(:interacao))
  end

  test "should destroy interacao" do
    assert_difference('Interacao.count', -1) do
      delete :destroy, :id => @interacao.to_param
    end

    assert_redirected_to interacoes_path
  end
end
