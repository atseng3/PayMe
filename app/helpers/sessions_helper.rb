module SessionsHelper
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end
  
  def logout_current_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
  
  def require_current_user!
    if current_user.nil?
      flash[:danger] = ["Please Log In to Continue"]
      redirect_to root_url
    end
  end
  
  def require_no_current_user!
    redirect_to user_url(current_user) unless current_user.nil?
  end
end