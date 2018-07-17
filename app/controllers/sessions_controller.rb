class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
  
    if auth_hash = request.env["omniauth.auth"]

      user = User.find_or_create_by_omniauth(auth_hash)

      session[:user_id] = user.id
      flash.now[:success] = "Welcome #{@user.first_name}."

      redirect_to root_path 
  

    else   #if regular login 
      user = User.find_by(email: params[:email]) 
        if user && user.authenticate(params[:password]) 
          # Was params[:user][:email]) , trying [email]
         session[:user_id] = user.id
         # flash.now[:notice] = "Welcome #{@user.first_name}."
         redirect_to root_path
 
        else
          render signin_path, :notice => "try again; have you already signed up?"
        end
      end
    end



      # This whole branch can be refactored through .first_or_create 
      # oauth_email = request.env["omniauth.auth"]["info"]["email"]
      # if user = User.find_by(:email => oauth_email) #if your system knows this person 
      
      #    session[:user_id] = @user.id
      #    redirect_to root_path
       # else
       
       #  # create a user, we know they are but it's their first time here. 
       #   user = User.new(:email => oauth_email, password => SecureRandom.hex)
       #   if user.save
       #      session[:user_id] = @user.id
       #      redirect_to root_path
       #    else
       #      raise user.errors.full_messages.inspect
       #    end
       # end
    # @user = User.find_or_create_from_auth_hash(auth_hash) 
    # current_user = @user.id
    # redirect_to root_path
    # do |u|
    #   u.name = auth['info']['name']
    #   u.email = auth['info']['email']
    #   u.image = auth['info']['image']
    # end

    

  def destroy
    session.delete(:user_id)
    redirect_to root_path
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
  
end
