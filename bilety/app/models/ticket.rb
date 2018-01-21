class Ticket < ApplicationRecord
	validates :name, :presence => true, :length => {:minimum => 6}
	validates :email_address, :presence => true
	validates :price, :presence => true
	belongs_to :event
	belongs_to :user
	validate :event_price_range_is_correct

	def event_price_range_is_correct
		#if price < event.price_low
		#	errors.add('Price', 'is lower than the lowest acceptable price for the ticket')
		#end
		#if price > event.price_high
	#		errors.add('Price', 'is higher than the highest acceptable price for the ticket')
		#end
	end
end
