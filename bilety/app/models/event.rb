class Event < ApplicationRecord
	validates :artist, :presence => true
	validates :price_low, :presence => true
	validates :price_high, :presence => true
	validates :event_date, :presence => true
	has_many :tickets
end
