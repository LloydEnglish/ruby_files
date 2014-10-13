class Order < ActiveRecord::Base
has_many :product_orders
has_many :products, through: :product_order
belongs_to :user
belongs_to :card

end
