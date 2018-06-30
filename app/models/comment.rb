class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :soupkitchen

	validates_presence_of :content
end

# belongs_to :user, optional: true 