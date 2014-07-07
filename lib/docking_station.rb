class DockingStation

	def initialize(bikes: [])
		@bikes = bikes
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

end