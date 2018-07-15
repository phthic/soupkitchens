class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :soupkitchens, through: :comments
  validates  :first_name, presence: true, length: {maximum: 20}
  validates :last_name, presence: true, _confirmation: true, length: {maximum: 20}
  validates :password, presence: true, length: {minimum: 8}
 
 def self.find_or_create_from_auth_hash(auth_hash) 
   user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.nickname,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
    user
  end
  # Will sessions be able to use this? 

# #fix
#   def name(first_name, last_name)
#     {first_name} + {last_name}
#   end 
private
  def auth_hash
    request.env['omniauth.auth']
  end 
end
