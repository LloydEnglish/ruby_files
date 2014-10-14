class User < ActiveRecord::Base

	has_many :orders
	has_many :cards

	has_secure_password  
	validates :email, 
			:presence => {:message => "Please enter your email"}, 
			:uniqueness => {:message => "This email is already being used"}
	

end
