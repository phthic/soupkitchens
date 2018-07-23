class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :soupkitchens, through: :comments

  validates  :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true,  length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 8}
  # validates :email, uniqueness: :true
  validates :email, email_format: { message: 'is not looking good' }
  # validates_email_format_of :email, :message => 'use a proper email.' SO says the only way to do it really is send a message with a verification link; that regex has too many edge cases https://www.youtube.com/watch?v=xxX81WmXjPg . With regex -- validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


 # scope :most_comments, -> { User.all.comments.count } 
 # -works in console with a specific user but not here. How would I get a specific top user in there? 


 def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.first_name = auth_hash["info"]["name"]
      # user.provider = auth_hash["provider"]
      user.id = auth_hash["uid"]
    end 
  end

end
 