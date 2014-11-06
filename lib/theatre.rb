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

	def clear_above?(coordinates)
	 	if relative_seat_empty?(coordinates,1) && !relative_seat_empty?(coordinates,2)
	 		false
		else
			true
		end
	end 


	def relative_seat_empty?(coordinates, displacement)
		return false unless relative_seat(coordinates,displacement)
		seat_empty?(relative_seat(coordinates,displacement))
	end

	def relative_seat(coordinates, displacement)
		relative_seat = [ coordinates[0],coordinates[1] + displacement] 
		return relative_seat if is_valid_seat?(relative_seat)
		nil 
	end

	def adjacent_seats(coordinates)
		adjacent_seats = []
		adjacent_seats << [coordinates[0],coordinates[1] - 1 ] if is_valid_seat?([coordinates[0], coordinates[1] - 1])
		adjacent_seats << [coordinates[0],coordinates[1] + 1 ] if is_valid_seat?([coordinates[0], coordinates[1] + 1])
	end

	def two_seats_above(coordinates)
		two_seats_above = []
		two_seats_above << [coordinates[0],coordinates[1] + 1 ] if is_valid_seat?([coordinates[0], coordinates[1] + 1])
		two_seats_above << [coordinates[0],coordinates[1] + 1 ] if is_valid_seat?([coordinates[0], coordinates[1] + 2])
	end



	def booking_creates_lonely_seat?
	end

	def has_empty_adjacent?(coordinates)
		adjacent_seats(coordinates).map{ |seat| seat_empty?(seat) }.reduce(:|)		
	end

	def is_available?(coordinates)
		has_empty_adjacent?(coordinates) && seat_empty?(coordinates)
	end


end