class StudentCoursesController < ApplicationController
  #student enrollment
  def create
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
    StudentCourse.create(course: course_to_add, student: current_user)
    flash[:success] = "You have successfully enrolled in the #{course_to_add.name} course!"
    redirect_to current_user
    else
      flash[:danger]= "Your enrollment couldn't be done."
      redirect_to rooth_path
    end
  end
end
