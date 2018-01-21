class Ticket < ApplicationRecord
	validates :name, :presence => true, :length => {:minimum => 6}
	validates :email_address, :presence => true
	validates :price, :presence => true
	belongs_to :event
	belongs_to :user
	validate :there_are_seats_available
	validate :ticket_limit_in_range
	validate :event_price_range_is_correct
	validate :event_taking_place_in_the_month

	def event_taking_place_in_the_month
		if Date.today-1.month < event.event_date
			errors.add('Event date', 'is too late to buy a ticket for it yet')
		end
		if Date.today > event.event_date
			errors.add('Event date', 'is in the past - cannot buy a ticket for the past event')
		end
	end

	def event_price_range_is_correct
		if price < event.price_low
			errors.add('Price', 'is lower than the lowest acceptable price for the ticket')
		end
		if Date.today != event.event_date && price > event.price_high
			errors.add('Price', 'is higher than the highest acceptable price for the ticket')
		end
		if Date.today == event.event_date && price != (event.price_high + event.price_high*0.2).round(2) 
			errors.add('Price', 'on ticket bought in the event day is '+ (event.price_high + event.price_high*0.2).round(2).to_s)
		end
	end

	def there_are_seats_available
		if event.maxSeats != nil && event.maxSeats != 0 && event.maxSeats <= event.tickets.size
			errors.add('Ticket limit', 'for this event has been expended')
		end
	end

	def ticket_limit_in_range
		if event.singleBuyerLimit != nil && event.singleBuyerLimit != 0 && event.singleBuyerLimit <= user.tickets.where(event_id: event_id).count
			errors.add('Ticket limit', 'for this buyer has been expended')
		end
	end
end
