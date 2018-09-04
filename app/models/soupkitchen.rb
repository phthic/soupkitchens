class Soupkitchen < ApplicationRecord
	has_many :comments
	accepts_nested_attributes_for :comments ,reject_if: :all_blank, :allow_destroy => true 
  has_many :users, through: :comments

  validates_presence_of :name, :address, :city, :state, :zipcode

  validates_uniqueness_of :name, :address
  validates_numericality_of :zipcode, length: {maximum: 5}
  
  def self.most_popular
    Soupkitchen.all.order("comments_count DESC").first
  end

  def self.current_user_name(current_user)
    @current_user = self.user.id 
    @current_user_name = self.user.first_name 
  end 

# to find most_popular, there are several possibilities
# Soupkitchen.comments.count  and iterate through to get the highest
  # or: Soupkitchen.all.order("comments_count DESC").first
  #  or: scope :most_popular, -> { Soupkitchen.maximum('comments_count') }
 # scope :most_popular, -> { Soupkitchen.maximum('comments_count') }


# scope :most_popular, -> {Soupkitchen.all.order("comments_count DESC")first }
# This works: Soupkitchen.select(:comments_count, :DESC)


end
  


