require 'bike'

describe Bike do

	it 'is not broken when created' do
		bike = Bike.new
		expect(bike.broken?).to be false
	end
	
end