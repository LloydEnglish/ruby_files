class Card < ActiveRecord::Base

	has_many :orders

	belongs_to :user

	validates :card_number, numericality: true, length: {is: 16}
	validates :security_code, numericality: true, length: {is: 3}

end
