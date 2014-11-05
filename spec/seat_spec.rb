describe Seat do 

	let(:seat) { Seat.new }

	it "is created unbooked" do 
		expect(seat.booked?).to eq(false)
	end




end