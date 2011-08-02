require 'test_helper'

class GerarArffControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get gerar" do
    get :gerar
    assert_response :success
  end

end
