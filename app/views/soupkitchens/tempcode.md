<ul>

  <%= @soupkitchen.comments.each do |comment| %>
    <li><%= comment.title %> </li>
    <li><%= comment.content %>
  <% end %>
</ul>


<%= link_to 'Edit', edit_soupkitchen_comment_path(@comment) %>
  <%= link_to "Delete Comment", [soupkitchen.comment, comment],
      method: :delete, data: {confirm: 'Are you sure?'}  %>