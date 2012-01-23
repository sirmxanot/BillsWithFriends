require 'test_helper'

class IPaidYousControllerTest < ActionController::TestCase
  setup do
    @i_paid_you = i_paid_yous(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:i_paid_yous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create i_paid_you" do
    assert_difference('IPaidYou.count') do
      post :create, i_paid_you: @i_paid_you.attributes
    end

    assert_redirected_to i_paid_you_path(assigns(:i_paid_you))
  end

  test "should show i_paid_you" do
    get :show, id: @i_paid_you.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @i_paid_you.to_param
    assert_response :success
  end

  test "should update i_paid_you" do
    put :update, id: @i_paid_you.to_param, i_paid_you: @i_paid_you.attributes
    assert_redirected_to i_paid_you_path(assigns(:i_paid_you))
  end

  test "should destroy i_paid_you" do
    assert_difference('IPaidYou.count', -1) do
      delete :destroy, id: @i_paid_you.to_param
    end

    assert_redirected_to i_paid_yous_path
  end
end
