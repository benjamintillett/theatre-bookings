describe Theatre do 

	let(:the_roundhouse) { Theatre.new }

	it "knows if a seat is empty" do 
		expect(the_roundhouse.seat_empty?([0,0])).to eq(true)
	end

	it "can set a seat to be booked" do 
		the_roundhouse.book_seat([0,0])
		expect(the_roundhouse.seat_empty?([0,0])).to eq(false)
	end

	context "vaild seats" do 

		it "knows [1,1] is a valid row" do 
			expect(the_roundhouse.is_valid_row?([1,1])).to eq true
		end

		it "knows [100,1] is not a valid row" do 
			expect(the_roundhouse.is_valid_row?([100,1])).to eq false
		end

		it "knows [1,1] is a valid row" do 
			expect(the_roundhouse.is_valid_row?([1,1])).to eq true
		end

		it "knows [100,1] is not a valid row" do 
			expect(the_roundhouse.is_valid_row?([100,1])).to eq false
		end

		it "knows [-1,1] is not a valid row" do 
			expect(the_roundhouse.is_valid_row?([100,1])).to eq false
		end

		it "knows [1,1] is a valid seat number" do 
			expect(the_roundhouse.is_valid_seat_number?([1,1])).to eq true 
		end

		it "knows [1,50] is not a valid seat number" do 
			expect(the_roundhouse.is_valid_seat_number?([1,50])).to eq false
		end

		it "knows [1,-1] is not a valid seat number" do 
			expect(the_roundhouse.is_valid_seat_number?([1,50])).to eq false
		end

		it "knows [100,1] is not a valid row" do 
			expect(the_roundhouse.is_valid_row?([100,1])).to eq false
		end

		it "knows [1,1] is a valid seat" do 
			expect(the_roundhouse.is_valid_seat?([1,1])).to eql true
		end

		it "knows [-1,1] is not a valid seat" do 
			expect(the_roundhouse.is_valid_seat?([-1,1])).to eql false
		end

	end


	context "seat availability in a non empty theatre" do 

		before do
			the_roundhouse.book_seat([0,2])
			the_roundhouse.book_seat([0,4])
		end

		it "knows [0,5] is available" do 
			expect(the_roundhouse.is_available?([0,5])).to eq true
		end		

		it "knows [0,0] is unavailabe" do 
			expect(the_roundhouse.is_available?([0,0])).to eq false
		end

	end

	it "knows wheather booking the seat create a single unbooked seat above" do 
		the_roundhouse.book_seat([0,2])
		expect(the_roundhouse.clear_above?([0,0])).to eq false		
	end

	it "knows wheather booking the seat create a single unbooked seat above" do 
		expect(the_roundhouse.clear_above?([0,48])).to eq false		
	end

	it "knows that a booking that sandwiches an empty seat to the end of the row is unailable" do
		expect(the_roundhouse.is_available?([0,48])).to eq false		
	end 

	it "knows that a booking that sandwiches an empty seat to the beggingng of the row is unailable" do
		expect(the_roundhouse.is_available?([0,1])).to eq false		
	end 









end