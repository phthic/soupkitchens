class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :soupkitchens, through: :comments


  validates  :first_name, presence: true, length: {maximum: 30}
  # validates :last_name, presence: true, _confirmation: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 8}
  validates :email, uniqueness: :true
  validates_numericality_of :mobile_number


 def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.first_name = auth_hash["info"]["name"]
      # user.provider = auth_hash["provider"]
      user.id = auth_hash["uid"]
    end 
  end
end
 

# #fix
#   def change_to_first_name(name)
#     --> split into two, take whatever's in front of the space ? 
#   end 


   
   # if user = User.find_by(:email => oauth_email)
   #   return user
   # else
   #  user = User.create(:email => oauth_email, :password => SecureRandom.hex)
  
   #  user.update(
   #    name: auth_hash.info.nickname,
   #    profile_image: auth_hash.info.image,
   #    token: auth_hash.credentials.token,
   #    secret: auth_hash.credentials.secret
   #  )
   #  user
\
