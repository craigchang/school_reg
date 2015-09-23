require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @task = tasks(:one)
    @enrollment = enrollments(:one)

    @update = {
      category: 'category1',
      name: 'name1',
      is_submitted: true,
      grade: 'A+',
      score: 100,
      max_score: 100
    }
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index, enrollment_id: @enrollment.id
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new, enrollment_id: @enrollment.id
    assert_response :success
  end

  test "should create task" do
    session[:user_id] = @user.id
    @task.enrollment = @enrollment

    assert_difference('Task.count') do
      post :create, task: @task, enrollment_id: @enrollment.id
    end

    assert_redirected_to task_path(assigns(:task), enrollment_id: enrollment.id)
  end

  test "should show task" do
    session[:user_id] = @user.id
    get :show, id: @task, enrollment_id: @enrollment.id
    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = @user.id
    get :edit, id: @task, enrollment_id: @enrollment.id
    assert_response :success
  end

  test "should update task" do
    session[:user_id] = @user.id
    @task.enrollment = @enrollment
    patch :update, task: @task, enrollment_id: @enrollment.id

    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    session[:user_id] = @user.id
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
