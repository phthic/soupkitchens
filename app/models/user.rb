class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :soupkitchens, through: :comments
  validates  :first_name, presence: true, length: {maximum: 20}
  validates :last_name, presence: true, _confirmation: true, length: {maximum: 20}
  validates :password, presence: true, length: {minimum: 8}
 

# #fix
#   def name(first_name, last_name)
#     {first_name} + {last_name}
#   end 
end
