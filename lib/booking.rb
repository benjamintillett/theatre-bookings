class Booking

	attr_reader :booking_string, :id, :start_coordinates, :booking_array, :end_coordinates, :coordinates

	def initialize(booking_string)
		@booking_string 	= booking_string
		@booking_array 		= get_booking_array
		@id 				= get_id
		@start_coordinates 	= get_start_coordinates
		@end_coordinates 	= get_end_coordinates
		@coordinates 		= set_coordinates
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

	def set_coordinates
		(1..length-1).inject([start_coordinates]) do 
			|result,elt| result << [start_coordinates[0],start_coordinates[1] + elt ]
		end
	end

	def length 
		1 + end_coordinates[1] - start_coordinates[1]
	end

	def valid?
		five_or_less? && on_one_row?
	end

	private 

		def five_or_less?
			length <= 5 
		end

		def on_one_row?
			end_coordinates[0] == start_coordinates[0]
		end

end