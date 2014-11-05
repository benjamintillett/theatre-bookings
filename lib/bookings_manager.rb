class BookingsManager

	attr_reader :text_parser

	def initialize(args)
		@text_parser = args[:text_parser]
	end

	def get_bookings_strings
		text_parser.bookings
	end

end 