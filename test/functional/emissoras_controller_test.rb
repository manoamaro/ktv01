require 'test_helper'

class EmissorasControllerTest < ActionController::TestCase
  setup do
    @emissora = emissoras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emissoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emissora" do
    assert_difference('Emissora.count') do
      post :create, :emissora => @emissora.attributes
    end

    assert_redirected_to emissora_path(assigns(:emissora))
  end

  test "should show emissora" do
    get :show, :id => @emissora.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @emissora.to_param
    assert_response :success
  end

  test "should update emissora" do
    put :update, :id => @emissora.to_param, :emissora => @emissora.attributes
    assert_redirected_to emissora_path(assigns(:emissora))
  end

  test "should destroy emissora" do
    assert_difference('Emissora.count', -1) do
      delete :destroy, :id => @emissora.to_param
    end

    assert_redirected_to emissoras_path
  end
end
