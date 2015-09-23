require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
	setup do
    @user = users(:one)
    @student = students(:one)
  end

  test "should get login page if not authenticated" do
    get :index
    assert_redirected_to login_url
  end

  test "should get dashboard page if authenticated" do
    session[:user_id] = @user.id
    @user.student = @student
    get :index
    assert_response :success
  end
end
