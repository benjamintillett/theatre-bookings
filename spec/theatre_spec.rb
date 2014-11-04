describe Theatre do 

	let(:the_roundhouse) { Theatre.new }

	it "can knows it seats are empty on initialization " do 
		expect(the_roundhouse.seat_empty?([0,0])).to eq(false)
	end

end