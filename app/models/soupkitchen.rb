class Soupkitchen < ApplicationRecord
	has_many :comments
	accepts_nested_attributes_for :comments ,reject_if: :all_blank, :allow_destroy => true 
  has_many :users, through: :comments

  validates_presence_of :name, :address, :city, :state, :zipcode

  validates_uniqueness_of :name, :address
  validates_numericality_of :zipcode, length: {maximum: 5}
  
  # new feature
  def self.most_popular
    Soupkitchen.all.order("comments_count DESC").first
  end

  def self.current_user_name(current_user)
    @current_user = self.user.id 
    @current_user_name = self.user.first_name 
  end 
<<<<<<< HEAD
=======


  def self.largest_hash_key(hash)
      self.comments_count.max_by {|k,v| v}}
  end 

  def self.biggest(comments_count)
    self.select { comments_count, value| value == self.values.max}
  end

  def self.most_comments
    self.where("comments_count").order("DESC")
    self.all.sort_by { |comments_count, v| v}.reverse
  end 
  # def reset_counter
  #   execute <<-SQL.squish
  #       UPDATE soupkitchens
  #          SET comments_count = (SELECT count(1)
  #                                  FROM comments
  #                                 WHERE comments.soupkitchen_id = soupkitchens.id)
  #   SQL
  # end
  # # feels like this can be refactored? but not sure how; Figure it out, so simple, this method isn't needed, it's just current_user.first_name

  # def comment_count
  #   comments.count
  # end

# order.comments.size("DESC").limit(1) Soupkitchen.includes(:comments).order(comments.size ASC)

  # def self.most_popular(soupkitchen)
  #   Soupkitchen.order("comments_count DESC").limit[1]
  # end

  # scope :most_popular, -> { Soupkitchen.where('comments_count').order("DESC")}

  

  # def most_popular
  #   Soupkitchen.all(:select => "comments.*, COUNT(comment_id) as post_count",
  #    :joins => "LEFT JOIN soupkitchen. AS soupkitchen. ON soupkitchen.comments_id = comment.id",
  #    :group => "soupkitchen.comments_id",
  #    :order => "soupkitchen_count DESC",
  #    :limit => 5)
  # end 
>>>>>>> most-popular

# to find most_popular, there are several possibilities
# Soupkitchen.comments.count  and iterate through to get the highest
  # or: Soupkitchen.all.order("comments_count DESC").first
  #  or: scope :most_popular, -> { Soupkitchen.maximum('comments_count') }
 # scope :most_popular, -> { Soupkitchen.maximum('comments_count') }


# scope :most_popular, -> {Soupkitchen.all.order("comments_count DESC")first }
# This works: Soupkitchen.select(:comments_count, :DESC)


end
  


