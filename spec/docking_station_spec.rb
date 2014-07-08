require 'docking_station'

describe DockingStation do

	let(:old_street) { DockingStation.new }
	let(:bike)       { double :bike       }

	it 'has no bikes when created' do
		expect(old_street.bikes).to eq []
	end

	it 'can dock a bike' do
		old_street.dock bike
		expect(old_street.bikes).to eq [bike]
	end
 
	it 'can release a bike' do
		old_street = DockingStation.new(bikes: [bike])
		old_street.release bike
		expect(old_street.bikes).to eq []
	end	

	it 'knows when it is full' do
		(DockingStation::DEFAULT_CAPACITY - 1).times { old_street.dock bike }
		expect(old_street.full?).to be false
		old_street.dock bike
		expect(old_street.full?).to be true
	end

	it 'should not allow a bike to be docked if max capacity has been reached' do
		(DockingStation::DEFAULT_CAPACITY).times { old_street.dock bike }
		expect{old_street.dock bike}.to raise_error(RuntimeError)
	end

	# this test should be split in two but i'm too lazy :)
	it 'knows which bikes are broken and which are not' do
		working_bike = double :bike, broken?: false
		broken_bike  = double :bike, broken?: true
		old_street   = DockingStation.new(bikes: [working_bike, broken_bike])
		expect(old_street.broken_bikes).to eq [broken_bike]
		expect(old_street.available_bikes).to eq [working_bike]
	end

end