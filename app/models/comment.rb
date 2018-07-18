class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :soupkitchen
  validates_presence_of :title, :content
  

  def self.blank_stars 
    5 - self.rating.to_i
  end 

  # make this into a scope method == pluralize(@soupkitchen.comments.count, "comment")%> 
  # user -submittable attribute -- comments.
  # validations 
  def self.show_rating
    self.comment.rating.to_i.times do 
      <span class="glyphicon glyphicon-star"></span>
      end
            
    self.comment.blank_stars.times do
      <span class="glyphicon glyphicon-star-empty"></span>      
    end
  end 


  def self.comments_quantity
    number= self.Comment.all.count
    puts "There are #{number} comments and growing!" 
  end
end

