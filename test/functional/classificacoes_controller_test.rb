require 'test_helper'

class ClassificacoesControllerTest < ActionController::TestCase
  setup do
    @classificacao = classificacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classificacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classificacao" do
    assert_difference('Classificacao.count') do
      post :create, :classificacao => @classificacao.attributes
    end

    assert_redirected_to classificacao_path(assigns(:classificacao))
  end

  test "should show classificacao" do
    get :show, :id => @classificacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @classificacao.to_param
    assert_response :success
  end

  test "should update classificacao" do
    put :update, :id => @classificacao.to_param, :classificacao => @classificacao.attributes
    assert_redirected_to classificacao_path(assigns(:classificacao))
  end

  test "should destroy classificacao" do
    assert_difference('Classificacao.count', -1) do
      delete :destroy, :id => @classificacao.to_param
    end

    assert_redirected_to classificacoes_path
  end
end
