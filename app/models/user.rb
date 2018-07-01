class User < ApplicationRecord
  has_many :comments
  has_many :soupkitchens

#fix
  def name(first_name, last_name)
    {first_name} + {last_name}
  end 
end
