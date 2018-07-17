class SoupkitchensController < ApplicationController
	# before_action :set_soupkitchen, only [:show, :edit, :update, :destroy]
  # add before_action for being logged in new, create, edit, update destroy 
  def index
  	@soupkitchens = Soupkitchen.all
  end 

  def new
    @soupkitchen = Soupkitchen.new
    flash.now[:notice] = "You must be logged in to add a new soupkitchen." if !logged_in?
  end

  def create 
   if logged_in? 
      @soupkitchen = Soupkitchen.new(soupkitchen_params)
      if @soupkitchen.save
        flash[:notice] = "#{@soupkitchen.name} was successfully added to the Soupkitchens in list. Will you leave the first comment?"
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
  		flash.now[:notice] = "Something went wrong"
  		render :edit
  	end 
  end 

  def destroy
  	@soupkitchen.destroy
  	redirect_to @soupkitchens_path
  end 

 private
  def soupkitchen_params
    params.require(:soupkitchen).permit(:name, :address, :city, :state, :zipcode)
  end 
       # :comments_attributes => [:title, :content])

  # def set_soupkitchen
  #   @soupkitchen = Soupkitchen.find(params[:id])
  # end 


end
