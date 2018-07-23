class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :soupkitchen
  validates_presence_of :title, :content
  

  scope :most_recently_updated, -> { Comment.last.soupkitchen.name } 
  scope :date_today, -> { Date.today } # add regex 

  # scope :recent, -> {order(“created_at DESC”) }
  # scope :comment_count -> { Comment.count }

  # scope :most_recently_updated, ->(comment){where(:updated_at => :desc)} 
  # scope :most_recently_updated, -> (Comment){ where(created_at: :desc) }  .each
    
  scope  :recent, -> { where('created_at >= ?', Date.today - 30) }
  # can be changed to last day, etc etc 

  # Comment.where('created_at >= ?', Date.today - 30)

  # def self.blank_stars 
  #   5 - self.rating.to_i
  # end 

  
  # def self.show_rating
  #   rating = self.comment.rating.to_i.times do 
  #     <span class="glyphicon glyphicon-star"></span>
  #     end
            
  #   self.comment.blank_stars.times do
  #     <span class="glyphicon glyphicon-star-empty"></span>      
  #   end
  # end 


end

