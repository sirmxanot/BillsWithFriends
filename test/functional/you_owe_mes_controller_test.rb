require 'test_helper'

class YouOweMesControllerTest < ActionController::TestCase
  setup do
    @you_owe_me = you_owe_mes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:you_owe_mes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create you_owe_me" do
    assert_difference('YouOweMe.count') do
      post :create, you_owe_me: @you_owe_me.attributes
    end

    assert_redirected_to you_owe_me_path(assigns(:you_owe_me))
  end

  test "should show you_owe_me" do
    get :show, id: @you_owe_me.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @you_owe_me.to_param
    assert_response :success
  end

  test "should update you_owe_me" do
    put :update, id: @you_owe_me.to_param, you_owe_me: @you_owe_me.attributes
    assert_redirected_to you_owe_me_path(assigns(:you_owe_me))
  end

  test "should destroy you_owe_me" do
    assert_difference('YouOweMe.count', -1) do
      delete :destroy, id: @you_owe_me.to_param
    end

    assert_redirected_to you_owe_mes_path
  end
end
