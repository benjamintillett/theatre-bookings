describe Booker do 

	let(:booking_one) { double :booking}
	let(:booking_two) { double :booking}
	let(:booking_three) { double :booking}
	let(:bookings) { [ booking_one, booking_two, booking_three] }
	let(:my_parser) { double :text_parser, bookings: bookings }
	let(:my_booker) { Booker.new( { text_parser: my_parser })}


	it "intializes with a TextParser" do 
		expect(my_booker.text_parser).to eq(my_parser)
	end

	it "can create a array of bookings" do 
		expect(my_booker.get_bookings).to eq(bookings)
	end

end