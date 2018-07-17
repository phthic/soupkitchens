<%= form_for([@soupkitchen, @comment]) do |f| %> 

    <%= f.label :title %><br>
    <%= f.text_field :title %>
    <br>
    <%= f.label :content %><br>
    <%= f.text_area :content, cols: 40, rows: 15 %>
    <%= f.submit %>
<% end %>

<%= link_to "Back to #{@soupkitchen.name}", soupkitchen_path(@soupkitchen) %> <br>
<%= link_to "All Soupkitchens", soupkitchens_path %> 