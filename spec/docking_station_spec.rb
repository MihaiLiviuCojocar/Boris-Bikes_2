require 'docking_station'

describe DockingStation do

	it 'has no bikes when created' do
		old_street = DockingStation.new
		expect(old_street.bikes).to eq []
	end

	it 'can dock a bike' do
		old_street = DockingStation.new
		bike = double :bike
		old_street.dock(bike)
		expect(old_street.bikes).to eq [bike]
	end

end