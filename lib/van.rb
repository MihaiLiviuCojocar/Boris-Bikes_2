require 'bike_container'

class Van

	include BikeContainer

	def initialize(capacity: DEFAULT_CAPACITY, bikes: [])
		@capacity = capacity
		@bikes    = bikes
	end

end