class DockingStation

	DEFAULT_CAPACITY = 10

	def initialize(bikes: [], capacity: DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes    = bikes
	end

	def bikes
		@bikes
	end

	def dock bike
		raise 'Sorry! No slots available' if full?
		bikes << bike
	end

	def release bike
		bikes.delete bike
	end

	def full?
		bikes.count == @capacity
	end

	def broken_bikes
		bikes.select { |bike| bike.broken? }
	end

	def available_bikes
		bikes - broken_bikes
	end

end