class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show]
  
  def index
  end

  def new
    @comment = Comment.new  
    @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])  
    flash.now[:notice] = "You must be logged in to leave a comment."  if !logged_in?
  end 

  def create
    if logged_in?
      @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
      @comment = @soupkitchen.comments.build(comment_params)
      @comment.user_id = current_user.id
      if @comment.save 
        flash[:notice] = "Thanks! We added your comment."
        redirect_to soupkitchen_path(@soupkitchen)
      else 
        flash.now[:notice] = "Something went wrong, try again."
        render :new
      end
    end
  end


  # def show
  # ADD THIS< WITH EDIT? edit link_to goes to this show page., if proper 
  # end 

  private 
  def comment_params
    params.require(:comment).permit(:title, :content, :rating, :soupkitchen_id, :user_id)
  end

#   # def set_comment
#   #   @comment = Comment.find(params[:id])
#   # end
end