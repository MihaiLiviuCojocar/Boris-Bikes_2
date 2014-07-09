require 'bike_container'

class Van

	include BikeContainer

	def initialize(capacity: DEFAULT_CAPACITY, bikes: [])
		@capacity = capacity
		@bikes    = bikes
	end

	def pick_up_broken_bikes_from docking_station
		docking_station.broken_bikes.each do |broken_bike|
			docking_station.release broken_bike
			dock broken_bike
		end
	end

end