describe Theatre do 

	let(:the_roundhouse) { Theatre.new }

	it "knows if a seat is empty" do 
		expect(the_roundhouse.seat_empty?([0,0])).to eq(true)
	end

	it "can set a seat to be booked" do 
		the_roundhouse.book_seat([0,0])
		expect(the_roundhouse.seat_empty?([0,0])).to eq(false)
	end

	it "knows [1,1] is a valid row" do 
		expect(the_roundhouse.is_valid_row?([1,1])).to eq true
	end

	it "knows [100,1] is not a valid row" do 
		expect(the_roundhouse.is_valid_row?([100,1])).to eq false
	end
	# it "given coordinates can retutn the coordinates of adjacent seats"
	# 	expect(the_roundhouse.adjacent_seats([0,1])).to eql([[0,0],[0,2])
	# end



	# it "knows if a given seat has an empty adjacent seat" do 
	# 	expect(the_roundhouse.empty_available?([1,0])).to eq(true)
	# end

end