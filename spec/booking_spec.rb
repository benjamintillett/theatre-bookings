describe Booking do 

	let(:booking_string) { "<0>,<0>:<5>,<0>:<7>" }
	let(:my_booking) { Booking.new(booking_string) }
	let(:long_booking) { Booking.new("<0>,<0>:<5>,<0>:<12>") }
	let(:multiple_row_booking) { Booking.new("<0>,<49>:<5>,<1>:<1>") }

	it "correctly assigns a booking array" do 
		expect(my_booking.booking_array).to eq(["0","0:5","0:7"])
	end

	it "correctly assign an id" do 
		expect(my_booking.id).to eql(0)
	end

	it "correctly assigns the start coordinates" do 
		expect(my_booking.start_coordinates).to eq([0,5])
	end

	it "correctly assigns the end coordinates" do 
		expect(my_booking.end_coordinates).to eq([0,7])
	end

	it "a booking of greater than 5 is invalid" do 
		expect(long_booking.valid?).to be false 
	end

	it "a booking that spans more than one row is invalid" do 
		expect(multiple_row_booking.valid?).to be false
	end

end