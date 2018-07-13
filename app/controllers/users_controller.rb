class UsersController < ApplicationController

	def new
		@user = User.new
	end 

	def show
		if logged_in?
			@user = User.find(params[:id])
		else
			redirect_to root_path
		end 
	end 
#signup
	def create
	  @user = User.new(user_params)
	  if @user.save
		session[:user_id] = @user.id #can be replaced with login_in @user (from the Sessions Helper) 
		flash.now[:success] = "Welcome #{@user.first_name}."
		redirect_to soupkitchens_path #go to index, add My profile tab to layout page
	  else 
		render :new, :alert => "Try again."
  	  end
	end

  private
	def user_params
      params.require(:user).permit( :first_name, :last_name, :email, :mobile_number, :zipcode, :about_me, :password, :password_confirmation)
       
    end
end
