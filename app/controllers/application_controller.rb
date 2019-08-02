class ApplicationController < ActionController::Base

  before_action :require_user
  helper_method :current_user, :logged_in?

  def current_user
    #if a session variable is set, it finds the student based on the student_id in the session
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
    # || - performs the db query only if the @current_user object doesn't exist
  end

  def logged_in?  #returns true or false
    !!current_user #is the user logged in?
  end

def require_user
  if !logged_in?
    flash[:danger] = "You must be logged in to perform this action!"
    redirect_to login_path
 end
end

end
