class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :soupkitchen

	validates_presence_of :title, :content

  # make this into a scope method == pluralize(@soupkitchen.comments.count, "comment")%> 
end

