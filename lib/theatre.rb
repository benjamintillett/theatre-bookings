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

	def is_valid_seat?(coordinates)
		is_valid_row?(coordinates) && is_valid_seat_number?(coordinates)
	end


	def adjacent_seats(coordinates)
		adjacent_seats = []
		adjacent_seats << [coordinates[0],coordinates[1] - 1 ] if is_valid_seat?([coordinates[0], coordinates[1] - 1])
		adjacent_seats << [coordinates[0],coordinates[1] + 1 ] if is_valid_seat?([coordinates[0], coordinates[1] + 1])
	end

	def has_empty_adjacent?(coordinates)
		adjacent_seats(coordinates).map{ |seat| seat_empty?(seat) }.reduce(:|)		
	end

	def is_available?(coordinates)
		has_empty_adjacent?(coordinates) && seat_empty?(coordinates)
	end


end