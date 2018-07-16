module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    redirect_to root_path 
  end 

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end 
end
