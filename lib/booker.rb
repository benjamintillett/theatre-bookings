class Booker

	attr_reader :text_parser

	def initialize(args)
		@text_parser = args[:text_parser]
	end

	def get_bookings
		text_parser.bookings
	end



end 