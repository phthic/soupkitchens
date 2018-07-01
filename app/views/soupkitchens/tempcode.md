<ul>

  <%= @soupkitchen.comments.each do |comment| %>
    <li><%= comment.title %> </li>
    <li><%= comment.content %>
  <% end %>
</ul>