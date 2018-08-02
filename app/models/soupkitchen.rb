class Soupkitchen < ApplicationRecord
	has_many :comments
	accepts_nested_attributes_for :comments ,reject_if: :all_blank, :allow_destroy => true 
  has_many :users, through: :comments

  validates_presence_of :name, :address, :city, :state, :zipcode

  validates_uniqueness_of :name, :address
  validates_numericality_of :zipcode, length: {maximum: 5}
  

  def self.current_user_name(current_user)
    @current_user = self.user.id 
    @current_user_name = self.user.first_name 
  end 

  def self.order(comments_count)
    @posts = Post.includes(:comments).order("comments.size ASC")
  end


  

  # feels like this can be refactored? but not sure how; Figure it out, so simple, this method isn't needed, it's just current_user.first_name

  # def self.comments?
  #   Soupkitchen.comments.count > 0
  # end 

# This works: Soupkitchen.select(:comments_count, :DESC)


end
  


	# # , reject_if proc { |att| att['name'].blank? }
	# # try: :reject_if => :all_blank
	# accepts_nested_attributes_for :users, :allow_destroy => true
  # reject_if: :all_blank, allow_destroy: true
	# validates_presence_of :name

  # scopes go here, before methods 
  # scope :most_recently_updates, -> { order(updated_at: :desc_).first }

