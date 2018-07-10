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


<%= link_to 'Edit', edit_soupkitchen_comment_path(@comment) %>
  <%= link_to "Delete Comment", [soupkitchen.comment, comment],
      method: :delete, data: {confirm: 'Are you sure?'}  %>