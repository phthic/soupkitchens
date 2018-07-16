Phase 2
1. add in from round 1, little by little. 
2. static#home, add Login
3. create user model/controller to signup/login/logout
4. layout -- add a navbar 
5. save often, do little bits
6. 




problems: 
models aren't working, I can't get them nested. 
 <%= form_with(model: [ @soupkitchen, @comments ], local: true) do |f| %>

<%= f.hidden_field :user_id, value: @user.id %>
**

spring stop
spring binstub --all
spring start
rails s

Temp code 

<ul>

  <%= @soupkitchen.comments.each do |comment| %>
    <li><%= comment.title %> </li>
    <li><%= comment.content %>
  <% end %>
</ul>
'

<%= link_to "Signup", signup_path %>
<%= link_to "Signin", signin_path %>
<%= link_to "Logout", logout_path, method: :destroy %>WW
'

<%= link_to 'Edit', edit_soupkitchen_comment_path(@comment) %>
  <%= link_to "Delete Comment", [soupkitchen.comment, comment],
      method: :delete, data: {confirm: 'Are you sure?'}  %>


      class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end 

  def new
    @comment = Comment.new  
    @soupkitchen = Soupkitchen.find(params[:id])
    
  end 

  def create
    @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
    @comment = @soupkitchen.comments.build(comment_params)
    if @comment.save

      redirect_to soupkitchen_comment_path(@comment)
    else 
      render "soupkitchen/show"
    end
  end

  # def show
  #   @soupkitchen = Soupkitchen.find(params[:id])
  #   # @soupkitchen = Soupkitchen.find(id[:soupkitchen_id])
  #   @soupkitchen.comments.build
  # end
  
  # def edit 
  #   @soupkitchen.comments.build

  # end

  # def update
  # end

  # def destroy
  #   @soupkitchen = Soupkitchen.find(params[:soupkitchen_id])
  #   @comment = @soupkitchen.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to soupkitchen_path(@soupkitchen)
  # end

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


  <%= form_for @soupkitchen do |f| %>
  <%= f.collection_select :soupkitchen_name, Soupkitchen.all, :name, :name %>
  <%= f.text_field :content %>
  <%= f.submit %>
<% end %>

<%= form_for @comment do |f| %>
  <%= f.text_field :soupkitchen_name, list: "soupkitchen_autocomplete" %>
  <datalist id="soupkitchen_autocomplete">
    <% Soupkitchen.all.each do |category| %>
      <option value="<%= soupkitchen.name %>">
    <% end %>
  </datalist>
  <textarea name="post[content]"></textarea>
  <%= f.submit %>
<% end %>


  <%= f.hidden_field :user_id, value: current_user.id %>


<%= form_for([@soupkitchen, @comment]) do |f| %> 
    <%= f.hidden_field :soupkitchen_id, value: @soupkitchen.id %>
    
    <%= f.label "Title of Comment" %><br>
    <%= f.text_field :title %>
    <br>
    <%= f.label "Comment" %><br>
    <%= f.text_area :content, cols: 40, rows: 15 %>
   

  <%= f.submit %>
  
<% end %>

<%= form_for @comment do |f| %> 
    <%= f.hidden_field :soupkitchen_id, value: @soupkitchen.id %>
    
    <%= f.label "Title of Comment" %><br>
    <%= f.text_field :title %>
    <br>
    <%= f.label "Comment" %><br>
    <%= f.text_area :content, cols: 40, rows: 15 %>
   

  <%= f.submit %>
  
<% end %>

<%= fields_for @comments do |comment| %>

    <%= comment.label "Title of Comment" %><br>
    <%= comment.text_field :title %>
    <br>
    <%= comment.label "Comment" %><br>
    <%= comment.text_area :content, cols: 40, rows: 15 %>
   <% end %>
***

   <input type="checkbox" name=? value="1"
