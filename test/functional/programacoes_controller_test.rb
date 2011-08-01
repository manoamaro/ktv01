require 'test_helper'

class ProgramacoesControllerTest < ActionController::TestCase
  setup do
    @programacao = programacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create programacao" do
    assert_difference('Programacao.count') do
      post :create, :programacao => @programacao.attributes
    end

    assert_redirected_to programacao_path(assigns(:programacao))
  end

  test "should show programacao" do
    get :show, :id => @programacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @programacao.to_param
    assert_response :success
  end

  test "should update programacao" do
    put :update, :id => @programacao.to_param, :programacao => @programacao.attributes
    assert_redirected_to programacao_path(assigns(:programacao))
  end

  test "should destroy programacao" do
    assert_difference('Programacao.count', -1) do
      delete :destroy, :id => @programacao.to_param
    end

    assert_redirected_to programacoes_path
  end
end
