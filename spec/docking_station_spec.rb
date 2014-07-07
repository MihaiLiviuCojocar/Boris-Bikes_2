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

end