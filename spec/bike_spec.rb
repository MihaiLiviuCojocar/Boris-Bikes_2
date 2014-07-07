require 'bike'

describe Bike do

	it 'is not broken when created' do
		bike = Bike.new
		expect(bike.broken?).to be false
	end

	it 'can break' do
		broken_bike = Bike.new.break!
		expect(broken_bike.broken?).to be true
	end
	
end