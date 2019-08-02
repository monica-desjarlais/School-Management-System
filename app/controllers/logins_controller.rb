class LoginsController < ApplicationController

skip_before_action :require_user, only: [:new, :create]
  def new
  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase) #params hash
    #verify the student object is valid & the password matches
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id #store the id in the session
      flash.now[:success] ="You have successfully logged in"
      redirect_to student

    else
    flash.now[:danger] ="Your login information is incorrect" #.now = displays only on that pag, then disappears
    render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:success] ="You have successfully logged out"
    redirect_to root_path
  end


end
