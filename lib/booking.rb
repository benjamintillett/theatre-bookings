class Booking

	attr_reader :booking_string, :id, :start_coordinates, :booking_array, :end_coordinates

	def initialize(booking_string)
		@booking_string 	= booking_string
		@booking_array 		= get_booking_array
		@id 				= get_id
		@start_coordinates 	= get_start_coordinates
		@end_coordinates 	= get_end_coordinates
	end

	def get_booking_array
		booking_string.gsub(/[<>]/,"").split(",")
	end

	def get_id
		booking_array[0].to_i
	end

	def get_start_coordinates
		booking_array[1].split(":").map { |elt| elt.to_i }
	end

	def get_end_coordinates
		booking_array[2].split(":").map { |elt| elt.to_i }
	end

end