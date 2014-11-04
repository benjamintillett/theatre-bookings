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

end