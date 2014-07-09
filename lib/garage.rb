require 'bike_container'

class Garage

	include BikeContainer

	def initialize(capacity: DEFAULT_CAPACITY, bikes: [])
		@capacity, @bikes = capacity, bikes
	end

end