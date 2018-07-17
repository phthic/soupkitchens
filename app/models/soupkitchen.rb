class Soupkitchen < ApplicationRecord
	has_many :comments
	accepts_nested_attributes_for :comments
  # ,reject_if: :all_blank, :allow_destroy => true 
  has_many :users, through: :comments

  # validates_presence_of :name, :address, :city, :state, :zipcode, :phone, :indoors, :hours, :website

  # validates_uniqueness_of :name, :address, :website
  # validates_numericality_of :zipcode, :phone
  # validates_associated :comments
end
  


	# # , reject_if proc { |att| att['name'].blank? }
	# # try: :reject_if => :all_blank
	# accepts_nested_attributes_for :users, :allow_destroy => true
  # reject_if: :all_blank, allow_destroy: true
	# validates_presence_of :name

  # scopes go here, before methods 
  # scope :most_recently_updates, -> { order(updated_at: :desc_).first }

