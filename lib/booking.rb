class Booking

	attr_reader :booking_string, :id

	def initialize(booking_string)
		@booking_string = booking_string
		@id = get_id
	end

	def get_id
		@booking_string.split(",")[0].gsub(/[<>]/,"").to_i
	end
end