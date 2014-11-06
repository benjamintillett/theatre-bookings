class BookingsManager

	attr_reader :text_parser, :theatre

	def initialize(args)
		@text_parser = args[:text_parser]
		@theatre 	 = args[:theatre]
	end

	def get_bookings_strings
		text_parser.bookings
	end

	def create_booking(booking_string)
		Booking.new(booking_string)
	end

	def booking_available?(booking)
		return false unless booking.is_valid?
		booking.coordinates.each { |coordinate| return false if !theatre.is_available?(coordinate) }
		true
	end



end 