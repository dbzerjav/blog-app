require 'test_helper'

class BlockedUsersControllerTest < ActionController::TestCase
  setup do
    @blocked_user = blocked_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blocked_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blocked_user" do
    assert_difference('BlockedUser.count') do
      post :create, blocked_user: { blocked_id: @blocked_user.blocked_id, blocked_username: @blocked_user.blocked_username, user_id: @blocked_user.user_id }
    end

    assert_redirected_to blocked_user_path(assigns(:blocked_user))
  end

  test "should show blocked_user" do
    get :show, id: @blocked_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blocked_user
    assert_response :success
  end

  test "should update blocked_user" do
    patch :update, id: @blocked_user, blocked_user: { blocked_id: @blocked_user.blocked_id, blocked_username: @blocked_user.blocked_username, user_id: @blocked_user.user_id }
    assert_redirected_to blocked_user_path(assigns(:blocked_user))
  end

  test "should destroy blocked_user" do
    assert_difference('BlockedUser.count', -1) do
      delete :destroy, id: @blocked_user
    end

    assert_redirected_to blocked_users_path
  end
end
