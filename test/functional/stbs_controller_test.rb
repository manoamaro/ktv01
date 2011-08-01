require 'test_helper'

class StbsControllerTest < ActionController::TestCase
  setup do
    @stb = stbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stb" do
    assert_difference('Stb.count') do
      post :create, :stb => @stb.attributes
    end

    assert_redirected_to stb_path(assigns(:stb))
  end

  test "should show stb" do
    get :show, :id => @stb.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stb.to_param
    assert_response :success
  end

  test "should update stb" do
    put :update, :id => @stb.to_param, :stb => @stb.attributes
    assert_redirected_to stb_path(assigns(:stb))
  end

  test "should destroy stb" do
    assert_difference('Stb.count', -1) do
      delete :destroy, :id => @stb.to_param
    end

    assert_redirected_to stbs_path
  end
end
