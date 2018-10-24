class SoupkitchensController < ApplicationController
	# before_action :set_soupkitchen, only [:show, :edit, :update, :destroy]
  # add before_action for being logged in new, create, edit, update destroy 


<<<<<<< HEAD
  def most_popular
    @soupkitchens = Soupkitchen.all
  end 
=======
  # def most_popular
  #   @soupkitchen = Soupkitchen.most_comments

  #   # @comments = Comment.all
  #   @users = User.all
  #   # @soupkitchen = Soupkitchen.most_popular
  #   @soupkitchens = Soupkitchen.all
  # end 
>>>>>>> most-popular

  def index
  	@soupkitchens = Soupkitchen.all
  end 

  def new
    if logged_in?
      @soupkitchen = Soupkitchen.new
    else
      flash.now[:notice] = "You must be logged in to add a new soupkitchen." 
    end 
  end

  def create 
   if logged_in? 
      @soupkitchen = Soupkitchen.new(soupkitchen_params)
      if @soupkitchen.save
        flash[:notice] = "#{@soupkitchen.name} was successfully added to the Soupkitchens in list. Will you leave the first review?"
    	  redirect_to soupkitchen_path(@soupkitchen)
      else
        flash.now[:notice] = "Something went wrong"
    		render :new
    	end 
    end
  end


  def show
    @soupkitchen = Soupkitchen.find(params[:id])
  end

  def edit 
      @soupkitchen = Soupkitchen.find(params[:id])
  end

  def update
    @soupkitchen = Soupkitchen.find(params[:id])
  	@soupkitchen.update(soupkitchen_params)
  	if @soupkitchen.save
  		redirect_to soupkitchen_path(@soup_kitchen), notice: "Changes to #{@soupkitchen.name} were successful."
  	else 
  		render :edit
  	end 
  end 


  def destroy
  	@soupkitchen.destroy
  	redirect_to @soupkitchens_path
  end 

 private
  def soupkitchen_params
    params.require(:soupkitchen).permit(:name, :address, :city, :state, :zipcode, :rating, :most_popular, :comments_count)
  end 

  # def set_soupkitchen
  #   @soupkitchen = Soupkitchen.find(params[:id])
  # end 


end
