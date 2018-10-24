class Comment < ApplicationRecord
  
	belongs_to :user
	belongs_to :soupkitchen, :counter_cache => true
  validates_presence_of :title, :content

  scope :most_recently_updated, -> { Comment.last.soupkitchen.name } 
  scope :date_today, -> { Date.today } # add regex 
  scope  :recent, -> { where('created_at >= ?', Date.today - 30) }

  # def self.reset
  #   Soupkitchen.find_each { |soupkitchen| Soupkitchen.reset_counters(soupkitchen.id, :comments) }
  # end 

   # scope :recent, -> {order(“created_at DESC”) }
  # scope :comment_count -> { Comment.count }

  # scope :most_recently_updated, ->(comment){where(:updated_at => :desc)} 
  # scope :most_recently_updated, -> (Comment){ where(created_at: :desc) }  .each
    
  # can be changed to last day, etc etc 

# #next phase of project  -- rating system with stars
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

