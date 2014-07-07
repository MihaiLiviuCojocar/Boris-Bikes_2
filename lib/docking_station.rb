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
		bikes << bike
	end

	def release bike
		bikes.delete bike
	end

	def full?
		bikes.count == @capacity
	end

end