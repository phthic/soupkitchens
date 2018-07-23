Sunday night: 
1. MONDAY: Blog
2. do README, pick a license DONE
3. MONDAY: check/add helper methods and partials, esp partials. 
4. record working on this:   DONE, in Flatiron folder on desktop 
5. commit often WORKING ON IT!
6. MONDAY: make a video walkthrough -- zoom, then put on youtube and get url 

7. fix bugs 

-FIX: soupkitchens/new -- added by  is an object, should be a name
    prob is in soupkitchens, fix is in user.rb -> move it to soupkitchens.rb, even though it feels like a user thing. Could also move it to a helper file, but okay for now. 

-FIX: soupkitchens/show  --> make a review. BUG FIXED. 
profile? users/show -- CHECK from other entry 
-CHECK IF BUG: if not logged in, comments.new fritzes FIXED
-GETS stuck on current_user.id -- because it doesn't need ID? YUP. FIXED
FIX -- Users/index -- how to delete duplicates
FIX -- find a way that a user can click to see comments stats, all on one page. 

-FIX SCOPE ISSUE DONE --maybe check again 
 FIX view issue related to scope  
  Tried to do this, no luck yet: 
        <p> The person who has left the most reviews is <%= @user.most_comments %>
          scope :most_comments, -> { User.all.comments.count } 
--> spent the morning playing with scopes, scheduled 1:1 

FIX -- email - I used email_field - it checks for @ and for somthing after @ but still a bad email entry can get by. 

Know expected return data of methods -- 




from comments new 
  <!--  <h3> As of <%= Date.today.to_s(:long) %> there are <%= @comment.comments_quantity %> crowdsourced reviews of Philadelphia's soupkitchens!.</h3> -->

          <% comment.rating.to_i.times do  %>
              <span class="glyphicon glyphicon-star"></span>
          <% end %>
          
          <% comment.blank_stars.times do %>
              <span class="glyphicon glyphicon-star-empty"></span>
        
          <% end %>

     