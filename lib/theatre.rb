class Theatre

	attr_accessor :seats

	def initialize
		@seats = Hash.new(false)
	end

	def seat_empty?(coordinates)
		seats[coordinates]
	end



end