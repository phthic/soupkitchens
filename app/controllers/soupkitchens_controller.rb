class SoupkitchensController < ApplicationController
	# before_action :set_soupkitchen, only [:show, :edit, :update, :destroy]

binding.pry
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
     # @comments = Comment.all
     @soupkitchen = Soupkitchen.find(params[:id])
      # @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])

      # @comment = Soupkitchen.comments.create(comment_params)
    
    redirect_to soupkitchen_path(@soupkitchen)
  end

 #  def edit 
 #  end

 #  def update
 #  	@soupkitchen.update(soupkitchen_params)
 #  	if @soupkitchen.save
 #  		redirect_to soupkitchen_path(@soup_kitchen), notice: "Changes to #{@soupkitchen} were successful."
 #  	else 
 #  		flash[:notice] = "Something went wrong"
 #  		render :edit
 #  	end 
 #  end 

 #  def destroy
 #  	@soupkitchen.destroy
 #  	redirect_to @soupkitchens_path
 #  end 

 private
 
  def soupkitchen_params
    params.require(:soupkitchen).permit(:name, :address, :city, :state, :zipcode, :phone, :indoors)
  end
# :comment_attributes[:title, :content, :soup_kitchen_id, :user_id]
  def comment_params
    params.requre(:comment).permit(:title, :content)
  end

   # def set_soupkitchen
   #  @soupkitchen = Soupkitchen.find(params[:id])
  # end 


end
