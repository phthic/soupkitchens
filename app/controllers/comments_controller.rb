class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show]
  
  def new
    @comment = Comment.new  
    # @soupkitchen = Soupkitchen.find(params[:id])
    
  end 

  def create
    @soupkitchen = Soupkitchen.find_by(params[:id])
    @comment = @soupkitchen.comments.build(comment_params)
    if @comment.save
      redirect_to soupkitchen_path(@soupkitchen)
    else 
      render "soupkitchen/show"
    end
  end

  # def show
  # end 

  private 
  def comment_params
    params.require(:comment).permit(:title, :content])
  end

  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end
end