class Product < ActiveRecord::Base

	has_many :product_orders
	has_many :orders, through: :product_order

	validates :name, 
				:uniqueness => {:message => "You've already used that name for a product, use a different one"}
	validates :description, 
			:presence => {:message =>"You can't add a product without a description!"}
end
