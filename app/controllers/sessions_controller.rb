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
binding.pry
      @user = User.find_by(email: params[:email]) 
      binding.pry
      if @user && @user.authenticate(params[:password]) 
          # Was params[:user][:email]) , trying [email]
         session[:user_id] = @user.id
         binding.pry
         redirect_to root_path
 
      else #doesn't work: bug: email gets past validator, throws an error. 
        binding.pry
          flash[:notice] = "try again; have you already signed up?"
          render :new
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
  
