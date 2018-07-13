class SessionsController < ApplicationController
  def new
    @user = User.new
  end


def create
    @user = User.find_by(first_name: params[:user][:first_name] # add .downcase ?? 

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] =@user.id
      flash.now[:success] = "Welcome #{@user.first_name}."
      redirect_to user_path(@user) 
    else 
      # try flash.now[:dander] = "try again. "
      render :new, :alert => "Try again."
    end
  end

  def destroy
    # session.clear, or use log_out from sessions helper 
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end 

  def sessions_params
   params.require(:user).permit(:first_name, :last_name, :password)# add password_confirmation
   end
end
