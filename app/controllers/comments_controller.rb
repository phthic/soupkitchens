class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end 

  def new
      @soupkitchen = Soupkitchen.find(params[:id])
  end 

  def create
    @soupkitchen = Soupkitchen.find(id[:soupkitchen_id])
    @comment = @soupkitchen.create_comments(comment_params)
    if @comment.save
      redirect_to soupkitchen_comment_path
    else 
      render 'soupkitchen(@soupkitchen)'
  end

  def show
    @soupkitchen = Soupkitchen.find(id[:soupkitchen_id])
    @soupkitchen.comments.build
  end
  
  # def edit 
  #   @soupkitchen.comments.build

  # end

  # def update
  # end

  def destroy
    @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
    @comment = @soupkitchen.comments.find(params[:id])
    @comment.destroy
    redirect_to soupkitchen_path(@soupkitchen)
  end

	private	
	def comment_params
		params.require(:comment).permit(:title, :content, :soupkitchen_id])
	end


 #  def set_comment
 #    @comment = Comment.find(params[:id])
 #  end 
end



  # def new
  #   # @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
  #   @soupkitchen = Soupkitchen.new
  #   @comment = @soupkitchen.comments.build(params[:comment])
  #     # params[comment_params])
  # end 

  # def create
  #   @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
  #   @comment = Comment.new

  #   if @comment.save 
  #     redirect_to soupkitchen_comment_path(@comment), notice: "Your comment was successfully added!"
  #   else 
   
  #     render :new, notice: "something went wrong"
  #   end

  # end  
