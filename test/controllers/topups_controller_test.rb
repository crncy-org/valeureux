require 'test_helper'

class TopupsControllerTest < ActionController::TestCase
  setup do
    @topup = topups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topup" do
    assert_difference('Topup.count') do
      post :create, topup: { admin_user_id: @topup.admin_user_id, amount: @topup.amount, receiver_id: @topup.receiver_id, reference: @topup.reference, status: @topup.status }
    end

    assert_redirected_to topup_path(assigns(:topup))
  end

  test "should show topup" do
    get :show, id: @topup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @topup
    assert_response :success
  end

  test "should update topup" do
    patch :update, id: @topup, topup: { admin_user_id: @topup.admin_user_id, amount: @topup.amount, receiver_id: @topup.receiver_id, reference: @topup.reference, status: @topup.status }
    assert_redirected_to topup_path(assigns(:topup))
  end

  test "should destroy topup" do
    assert_difference('Topup.count', -1) do
      delete :destroy, id: @topup
    end

    assert_redirected_to topups_path
  end
end
