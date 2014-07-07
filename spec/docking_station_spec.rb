require 'docking_station'

describe DockingStation do
	it 'has no bikes when created' do
		old_street = DockingStation.new
		expect(old_street.bikes).to eq []
	end
end