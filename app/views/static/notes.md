Sunday night: 
1. Blog
2. do README, pick a license 
3. check/add helper methods and partials 
4. record working on this:   DONE, in Flatiron folder on desktop 
5. commit often 
6. make a video walkthrough -- zoom, then put on youtube and get url 

7. fix bugs 

FIX: soupkitchens/new -- added by  is an object, should be a name
    prob is in soupkitchens, fix is in user.rb -> move it to soupkitchens.rb, even though it feels like a user thing. Could also move it to a helper file, but okay for now. 

-FIX: soupkitchens/show  --> make a review. BUG FIXED. 
profile? users/show -- CHECK from other entry 
-CHECK IF BUG: if not logged in, comments.new fritzes FIXED
-GETS stuck on current_user.id -- because it doesn't need ID? YUP. FIXED
FIX SCOPE ISSUE 



Know expected return data of methods -- 




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