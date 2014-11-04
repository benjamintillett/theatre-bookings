class Booking

	attr_reader :booking_string, :id, :start_coordinates

	def initialize(booking_string)
		@booking_string = booking_string
		@id = get_id
		@start_coordinates = get_start_coordinates
	end

	def get_id
		booking_string.split(",")[0].gsub(/[<>]/,"").to_i
	end

	def get_start_coordinates
		booking_string.split(",")[1].gsub(/[<>]/,"").split(":").map { |elt| elt.to_i }
	end


end