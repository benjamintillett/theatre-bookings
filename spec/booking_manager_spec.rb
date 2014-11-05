describe BookingsManager do 


	let(:booking_one) { double :booking}
	let(:booking_two) { double :booking}
	let(:booking_three) { double :booking}
	let(:bookings) { [ booking_one, booking_two, booking_three] }
	let(:my_parser) { double :text_parser, bookings: bookings }
	let(:my_booker) { Booker.new( { text_parser: my_parser })}



	it "intializes with a TextParser" do 
		expect(my_booker.text_parser).to eq(my_parser)
	end


		



	it "can return array of booking strings " do 
		expect(my_booker.get_bookings_strings).to eq(bookings)
	end



	# it "can create a booking from a string" do 
	# 	expect(my_booker.create_booking(booking_string)).to eq 
	# end




end