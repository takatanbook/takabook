class User < ActiveRecord::Base
	has_secure_password
	VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
	validates :user_email, uniqueness: true, format: {
			with: VALID_EMAIL_REGEX }
	validates :user_name, presence: true
	validates :password , presence: true

	validates :password_confirmation, presence: true

	def user_email=(value)
		value = value.strip.downcase
		write_attribute :user_email, value
	end	
end
