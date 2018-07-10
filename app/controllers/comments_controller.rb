class CommentsController < ApplicationController
  # before_action :set_comments, only: [:show, :edit, :update, :destroy]


  # def index	
  # end 

comment.sk
comment.sk=
comment.build_soupkitchen
comment.create_sk
comment.create_author!

belongs_to -- needs a build_ prefix (not association.build method used in has many)


@comment = comment.build_soupkitchen(soupkitchen_params)
@soupkitchen = @comment.soupkitchen

  def new
    @comment = Comment.new
    @soupkitchen = SoupKitchen.find(params[:soupkitchen][:id])
    @comments = @soupkitchen.comments.all
  end 

  def create
    @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])

    @comment = @soupkitchen.comments.create(comment_params)
   
    redirect_to soupkitchen_path(@soupkitchen)
    # where does data go -- create, associate with soupkitchen 
   
  end  

 #  def show
 #  end
  
  def edit 
  end

  def update
  end

 #  def destroy
 #  end

	private	
	def comment_params
		params.require(:comment).permit(:title, :content)
	end

 #  def set_comment
 #    @comment = Comment.find(params[:id])
 #  end 
end

