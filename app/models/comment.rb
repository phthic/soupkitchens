class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :soupkitchen
  # validates_presence_of :title, :comment
  
   # any other validations? 

  # make this into a scope method == pluralize(@soupkitchen.comments.count, "comment")%> 
  # user -submittable attribute -- comments.
  # validations 


end

