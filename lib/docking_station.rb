require 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(bikes: [], capacity: DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes    = bikes
	end

end