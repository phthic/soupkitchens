class SoupkitchensController < ApplicationController
	# before_action :set_soupkitchen, only [:show, :edit, :update, :destroy]

  def index
  	@soupkitchens = Soupkitchen.all
  end 

  def new
  	@soupkitchen = Soupkitchen.new
    @soupkitchen.comments.build
  end

  def create 
   
  	@soupkitchen = Soupkitchen.new(params[:soupkitchen_params])

  	if @soupkitchen.save
    
  		redirect_to soupkitchens_path, notice: "The Soup Kitchen #{@soupkitchen.name} was successfully added."
  	else
      flash.now[:notice] = "Something went wrong"
  		render :new
  	end 
  end

  def show
    @soupkitchen = Soupkitchen.find(params[:id])
  end


  def edit 
    @soupkitchen.comments.build
  end

  def update
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
    params.require(:soupkitchen).permit(:name, :address, :city, :state, :zipcode, :phone, :indoors, :comments_attributes => [:title, :content])
  end


  # def set_soupkitchen
  #   @soupkitchen = Soupkitchen.find(params[:id])
  # end 


end
