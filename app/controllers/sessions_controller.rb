class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
  
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to root_path 
  

    else   #if regular login 

      @user = User.find_by(email: params[:email]) 
   
      if @user && @user.authenticate(params[:password]) 
         session[:user_id] = @user.id   
         redirect_to root_path
 
      else #doesn't work: bug: email gets past validator, throws an error. 
     
          flash[:notice] = "try again; have you already signed up? Did you type everything correctly?"
          redirect_to signin_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end 
end
      
    
 # why are there so many ways to logout? which is best? 
#     # session.clear, or use log_out from sessions helper 
#     # or  User.find(session[:user_id]).destroy      
#     # session[:user_id] = nil   
#     # session.delete(:user_id)
#     # @current_user = nil

  # protected
  #   def auth_hash
  #     request.env['omniauth.auth']
  #   end 
  
