describe BookingsManager do 


	let(:booking_one) { double :booking , id: 1, start_coordinates: [0,5], end_coordinates: [0,7] }
	let(:booking_two) { double :booking}
	let(:booking_three) { double :booking}
	let(:bookings) { [ booking_one, booking_two, booking_three] }
	let(:my_parser) { double :text_parser, bookings: bookings }
	let(:my_bookings_manager) { BookingsManager.new( { text_parser: my_parser  })}
	let(:booking_string) { "<0>,<0>:<5>,<0>:<7>" }


	it "intializes with a TextParser" do 
		expect(my_bookings_manager.text_parser).to eq(my_parser)
	end


	it "can return array of booking strings " do 
		expect(my_bookings_manager.get_bookings_strings).to eq(bookings)
	end


	it "can creates a new booking" do 
		expect(Booking).to receive(:new).and_return(booking_one) 
		my_bookings_manager.create_booking(booking_string)
	end

	it "returns the created booking" do 
		allow(Booking).to receive(:new).and_return(booking_one) 
		expect(my_bookings_manager.create_booking(booking_string)).to eq(booking_one)
	end

	context "an empty thetre" do 

		let(:empty_theatre) { double :theatre, seat_empty?: true }
		let(:my_bookings_manager) { BookingsManager.new( { text_parser: my_parser, theatre: empty_theatre })}
		

		it "knows a booking is valid" do 
			expect(my_bookings_manager.valid_booking?(booking_one)).to eq true
		end

	end

	# context "a full theatre" do 

	# 	let(:full_theatre) { double :theatre, seat_empty?: true }
	# 	let(:my_bookings_manager) { BookingsManager.new( { text_parser: my_parser, theatre: full_theatre })}
	
	# 	it "knows a booking is invalid" do 
	# 		expect(my_bookings_manager.valid_booking?(booking_one)).to eq false
	# 	end	


	# end






end