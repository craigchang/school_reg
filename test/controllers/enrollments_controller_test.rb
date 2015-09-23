require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @course = courses(:one)
    @enrollment = enrollments(:one)
    @student = students(:one)
  end

  test "should get index" do
    session[:user_id] = @user.id
    @enrollments =  Student.find(session[:user_id]).enrollments

    get :index
    assert_response :success
    assert_not_nil assigns(:enrollments)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "should create enrollment" do
    session[:user_id] = @user.id
    assert_difference('Enrollment.count') do
      post :create, enrollment: @enrollment, course_id: @course.id, format: 'js'
    end

    assert_response :success
  end

  test "should show enrollment" do
    session[:user_id] = @user.id
    get :show, id: @enrollment
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = @user.id
    get :edit, id: @enrollment
    assert_response :success
  end

  # test "should update enrollment" do
  #   session[:user_id] = @user.id
  #   patch :update, id: @enrollment, enrollment: @enrollment
  #   assert_redirected_to enrollment_path(assigns(:enrollment))
  # end

  test "should destroy enrollment" do
    session[:user_id] = @user.id
    assert_difference('Enrollment.count', -1) do
      delete :destroy, id: @enrollment
    end

    assert_redirected_to enrollments_path
  end
end
