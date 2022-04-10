require_relative "piece"
require_relative "slideable"

class Queen < Piece
	include "Slideable"

	def symbol 
		"♛".colorize(color)
	end

	private 

	def move_directions
		horizontal_and_vertical_directions + diagonal_directions
	end

end