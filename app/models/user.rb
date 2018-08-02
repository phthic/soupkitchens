class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password
  has_many :comments
  has_many :soupkitchens, through: :comments

  validates  :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true,  length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, uniqueness: :true,  format: { with: VALID_EMAIL_REGEX }

# bug: edit of about_me doesn't save -- likely because validations are stopping it, since it's not a full form, but when i tried the full form, password didn't auto=fill, and thus didn't pass validation. Fix?

 # scope :most_comments, -> { User.all.comments.count } 
 # -works in console with a specific user but not here. How would I get a specific top user in there? 

# scope :most_recently_updated, ->(comment){where(:updated_at => :desc)} 

 def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.first_name = auth_hash["info"]["name"]
      # user.provider = auth_hash["provider"]
      user.id = auth_hash["uid"]
    end 
  end

end
 