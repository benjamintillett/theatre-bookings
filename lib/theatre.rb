class Theatre

	attr_accessor :seats

	def initialize
		@seats = Hash.new(true)
	end

	def seat_empty?(coordinates)
		seats[coordinates]
	end

	def book_seat(coordinates)
		seats[coordinates] = false
	end

	def is_valid_row?(coordinates)
		0 <= coordinates[0] && coordinates[0] < 100
	end

	def is_valid_seat_number?(coordinates)
		0 <= coordinates[1] && coordinates[1] < 50
	end



	# def adjacent_seats(coordindates)
	# 	adjacent_seats = []
	# 	adjacent_seats << [coordinates[0],coordinates[1] + 1 ] if 
	# end

	# def empty_adjacent?(coordinates)
	# 	[coordinates[0] ] 
	# end

end