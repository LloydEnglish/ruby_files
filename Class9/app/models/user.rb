class User < ActiveRecord::Base

	has_many :orders
	has_many :cards

	has_secure_password 
	
	validates :password, presence: true, 
				on: :create, 
				confirmation: true

	validates :email, 
			:presence => {:message => "Please enter your email"}, 
			:uniqueness => {:message => "This email is already being used"}
	
	validates :username,
			:presence => {:message => "Enter an identifiable username"}, 
			:uniqueness => {:message => "Sorry but this username already exists, choose another "}
end
