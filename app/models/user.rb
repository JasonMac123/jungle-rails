class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
      no_space_email = email.strip
      user = User.where("email ILIKE '#{no_space_email}'").first
      
      if user && user.authenticate(password)
        return user
      end
  end
end