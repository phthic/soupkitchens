class SoupkitchensController < ApplicationController


  def index
  	@soupkitchens = Soupkitchen.all
  end 

  def new
  	@soupkitchen = Soupkitchen.new
  end


  def create 
  	@soupkitchen = Soupkitchen.new(soupkitchen_params)
  	if @soupkitchen.save
  		redirect_to soupkitchen_path(@soupkitchen), notice: "New Soup Kitchen was successfully added."
  	else 
  		flash[:notice] = "Something went wrong"
  		render :new
  	end 
  end

  def show
    @comments = Comment.all
    @soupkitchens = Soupkitchen.all
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
