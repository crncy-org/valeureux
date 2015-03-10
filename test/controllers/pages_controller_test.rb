require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get empty_page" do
    get :empty_page
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signin" do
    get :signin
    assert_response :success
  end

  test "should get lockscreen" do
    get :lockscreen
    assert_response :success
  end

  test "should get login_2" do
    get :login_2
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get not_found_error" do
    get :not_found_error
    assert_response :success
  end

  test "should get internal_server_error" do
    get :internal_server_error
    assert_response :success
  end

end
