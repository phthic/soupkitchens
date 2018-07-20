Phase 2
1. add in from round 1, little by little. 
2. static#home, add Login
3. create user model/controller to signup/login/logout
4. layout -- add a navbar 
5. save often, do little bits
6. add color to the flash, so it stands out from the  sk description after comment posts. 


Tuesday: 

from comments new 
  <!--  <h3> As of <%= Date.today.to_s(:long) %> there are <%= @comment.comments_quantity %> crowdsourced reviews of Philadelphia's soupkitchens!.</h3> -->

          <% comment.rating.to_i.times do  %>
              <span class="glyphicon glyphicon-star"></span>
          <% end %>
          
          <% comment.blank_stars.times do %>
              <span class="glyphicon glyphicon-star-empty"></span>
        
          <% end %>

          
    <%= f.label :rating %>
    <%= f.range_field :rating, in: 0..5%>