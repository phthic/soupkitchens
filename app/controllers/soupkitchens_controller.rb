class SoupkitchensController < ApplicationController


  def index
  	@soupkitchens = Soupkitchen.all
  end 

  def new
  	@soupkitchen = Soupkitchen.new
  end

  
  def create 
  	@soupkitchen = SoupKitchen.new(soup_kitchen_params)
  	if @soupkitchen.save
  		redirect_to soup_kitchen_path(@soup_kitchen), notice: "New SoupKitchen was successfully added."
  	else 
  		flash[:notice] = "Something went wrong"
  		render :new
  	end 
  end

  def show
    @comments = Comment.all
    @soupkitchens = SoupKitchen.all
  end

  def edit 
  end

  def update
  	@soupkitchen.update(soup_kitchen_params)
  	if @soupkitchen.save
  		redirect_to soup_kitchen_path(@soup_kitchen), notice: "Changes to #{@soupkitchen} were successful."
  	else 
  		flash[:notice] = "Something went wrong"
  		render :edit
  	end 
  end 


   def destroy
  	@soupkitchen.destroy
  	redirect_to @soupkitchens_path
  end 

 private
  def set_soupkitchen
	  @soupkitchen = Soupkitchen.find(params[:id])
  end 


  def soupkitchen_params
  	params.require(:soupkitchen).permit(:name, :address, :city, :state, :zipcode, :phone, :indoors)
  end 

end
