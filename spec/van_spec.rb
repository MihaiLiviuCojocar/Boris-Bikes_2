require 'bike_container_spec'
require 'van'

describe Van do

	let(:van) { Van.new }

	it_behaves_like 'a bike container'

	context 'At initialization' do
		it 'has a default capacity' do
			expect(van.capacity).to eq 10
		end

		it 'can be set to have a specific capacity' do
			van = Van.new(capacity: 23)
			expect(van.capacity).to eq 23
		end

		it 'can be instantiated with some bikes inside' do
			van = Van.new(bikes: [:a_bike, :another_bike])
			expect(van.bikes.count).to eq 2
		end
	end

	it 'can pick-up broken bikes from a docking station' do
		broken_bike1 = double :bike, broken?: true
		broken_bike2 = double :bike, broken?: true
		old_street   = double :station

		expect(old_street).to receive(:broken_bikes).and_return([broken_bike1, broken_bike2])
		expect(old_street).to receive(:release).with broken_bike1
		expect(old_street).to receive(:release).with broken_bike2

		van.pick_up_broken_bikes_from old_street

		expect(van.bikes).to eq [broken_bike1, broken_bike2]
	end

end