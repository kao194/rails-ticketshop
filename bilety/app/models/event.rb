class Event < ApplicationRecord
	validates :artist, :presence => true
	validates :price_low, :presence => true
	validates :price_high, :presence => true
	validates :event_date, :presence => true
	has_many :tickets
	validate :event_price_range_is_correct
	validate :event_date_not_from_past
	def event_price_range_is_correct
		if price_low > price_high
			errors.add('Price lower range', 'cannot be higher than price higher range')
		end
		if price_high < price_low
			errors.add('Price higher range', 'cannot be lower than price lower range')
		end
	end

	def event_date_not_from_past
		if event_date < Date.today
		errors.add('Data wydarzenia', 'nie może być z przeszłości')
		end
	end
end
