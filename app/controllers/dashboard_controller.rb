class DashboardController < ApplicationController

  def index
  	@student = Student.find_by(user_id: session[:user_id])
  	@enrollments = Enrollment.where(student_id: @student.id)
  end
  
end
