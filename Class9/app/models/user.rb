class User < ActiveRecord::Base
has_many :orders
has_many :cards

has_secure_password   
validates :password, presence: true, on: :create, confirmation: true
end
