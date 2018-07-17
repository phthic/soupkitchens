class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :soupkitchens, through: :comments


  validates  :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, _confirmation: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 8}
  validates_email_format_of :email, :message => "try again on the email."
  validates :email, uniqueness: :true
  validates :mobile_number, numericality: true
  validates :zipcode, numericality: true

 def self.find_or_create_by_omniauth(auth_hash)

    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.first_name = auth_hash["info"]["name"]
      # user.provider = auth_hash["provider"]
      user.id = auth_hash["uid"]
    end 
  end
end
   # 
  # Will sessions be able to use this? 

# #fix
#   def name(first_name, last_name)
#     {first_name} + {last_name}
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
