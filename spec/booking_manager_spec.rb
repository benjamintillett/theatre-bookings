describe BookingsManager do 


	let(:booking_one) { double :booking , id: 1, coordinates: [[0,5],[0,6],[0,7]] , is_valid?: true}
	let(:booking_two) { double :booking, id: 2, coordinates: [[0,6],[0,7],[0,8]] , is_valid?: true}
	let(:booking_three) { double :booking, id: 3, coordinates: [[0,7],[0,8],[0,9]] , is_valid?: true}
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

	context "an empty theatre" do 

		let(:empty_theatre) { double :theatre, seat_empty?: true, is_available?: true }
		let(:my_bookings_manager) { BookingsManager.new( { text_parser: my_parser, theatre: empty_theatre })}
		

		it "knows valid booking is available" do 
			expect(my_bookings_manager.booking_available?(booking_one)).to eq true
		end

	end

	context "a full theatre" do 

		let(:full_theatre) { double :theatre, is_available?: false}
		let(:my_bookings_manager) { BookingsManager.new( { text_parser: my_parser, theatre: full_theatre })}
	
		it "knows if a booking is unavailable" do 
			expect(my_bookings_manager.booking_available?(booking_one)).to eq false
		end	

	end

	context "a theatre with some bookings" do 
		
		let(:partly_full_theatre) { double :theatre, is_available?: true}
		let(:my_bookings_manager) { BookingsManager.new( { text_parser: my_parser, theatre: partly_full_theatre })}

		before do 
			allow(partly_full_theatre).to receive(:is_available?).with([0,5]).and_return(false)
		end

		it "a valid booking that collides with a booked seat is not available" do 
			expect(my_bookings_manager.booking_available?(booking_one)).to eq false
		end

		it "a valid booking that doesnt collide with a booked seat is available" do 
			expect(my_bookings_manager.booking_available?(booking_two)).to eq true
		end

		# it "a valid booking that if booked would create an isolated unbooked" do 
		# 	expect(my_bookings_manager.booking_available?(booking_three)).to eq false
		# end

	end





end