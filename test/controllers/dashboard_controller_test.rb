require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
	setup do
    @user = users(:one)
  end

  test "should not get index if not authenticated" do
    get :index
    assert_redirected_to login_url
  end

  test "should get index if authenticated" do
  	session[:user_id] = @user.id
  	if (User.find_by(id: session[:user_id]))
	  	get :index
	  	assert_response :success
  	end
  end
end
