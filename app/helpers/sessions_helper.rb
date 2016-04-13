module SessionsHelper
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logged_in?
    !current_user.nil?
  end
end
