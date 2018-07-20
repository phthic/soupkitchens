class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :soupkitchen
  validates_presence_of :title, :content
  
  scope :most_recently_updated -> {order[updated_at: :desc}.first } 


  # def most_recently_updated
  #   @comments = Comment.most_recently_updated
  # end 



  # def self.blank_stars 
  #   5 - self.rating.to_i
  # end 

  # make this into a scope method == pluralize(@soupkitchen.comments.count, "comment")%> 
  # user -submittable attribute -- comments.
  # validations 
  # def self.show_rating
  #   rating = self.comment.rating.to_i.times do 
  #     <span class="glyphicon glyphicon-star"></span>
  #     end
            
  #   self.comment.blank_stars.times do
  #     <span class="glyphicon glyphicon-star-empty"></span>      
  #   end
  # end 


  # def self.comments_quantity
  #  self.Comment.all.count
  # end
end

