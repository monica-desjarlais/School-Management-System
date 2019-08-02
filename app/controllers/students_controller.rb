class StudentsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:edit, :update, :show]
  before_action :require_same_student, only: [:edit, :update]

  def index
    @students= Student.all
  end

  def new
    @student= Student.new
  end

  def create
    @student= Student.new (student_params)
    if @student.save
    flash[:success] = "You have successfully signed up!"
    redirect_to root_path
    else
      render 'new'
  end
end

  def show

  end

  def edit

  end

  def update
    if @student.update(student_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to @student #his own profile
    else
      render 'edit'
    end
  end

private

def set_student
  @student = Student.find(params[:id])
end


  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def  require_same_student  #for the url operations!
    if current_user != @student
      flash[:danger] = "You can only edit your own profile!"
      redirect_to student_path(current_user)
  end
end

end
