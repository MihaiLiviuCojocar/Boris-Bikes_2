require 'bike_container'

shared_examples 'a bike container' do

	let(:container) { described_class.new }
	let(:bike)      { double :bike        }

	it 'has no bikes when created' do
		expect(container.bikes).to eq []
	end

	it 'can dock a bike' do
		container.dock bike
		expect(container.bikes).to eq [bike]
	end
 
	it 'can release a bike' do
		container.dock bike
		container.release bike
		expect(container.bikes).to eq []
	end	

	it 'knows when it is full' do
		(DockingStation::DEFAULT_CAPACITY - 1).times { container.dock bike }
		expect(container.full?).to be false
		container.dock bike
		expect(container.full?).to be true
	end

	it 'should not allow a bike to be docked if max capacity has been reached' do
		(DockingStation::DEFAULT_CAPACITY).times { container.dock bike }

		expect{container.dock bike}.to raise_error(RuntimeError)

	end

	# this test should be split in two but i'm too lazy :)
	it 'knows which bikes are broken and which are not' do
		working_bike = double :bike, broken?: false
		broken_bike  = double :bike, broken?: true
		container.dock working_bike
		container.dock broken_bike
		expect(container.broken_bikes).to eq [broken_bike]
		expect(container.available_bikes).to eq [working_bike]
	end

end