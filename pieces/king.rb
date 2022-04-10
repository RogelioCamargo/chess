require_relative "stepable"
require_relative "piece"

class King < Piece 
	include Stepable

	def symbol 
		"♚".colorize(color)
	end 

	private 

	def move_directions
		[
			[-1, -1], [1,  1],
			[-1,  0], [0, -1],
			[ 1,  0], [0,  1],
			[-1,  1], [1, -1]
		]
	end

end