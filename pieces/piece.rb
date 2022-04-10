class Piece
	attr_reader :board, :color 
	attr_accessor :position 

	def initialize(color, board, position)
		raise "Invalid color" unless %i(white black).include?(color)
		raise "Invalid position" unless board.valid_position?(position)

		@color, @board, @position = color, board, position
		
		board.add_piece(self, position)
	end

	def empty?
		false 
	end

	def to_s
		" #{symbol} "
	end

	def symbol 
		raise NotImplementedError
	end

	def valid_moves

	end

	private 

	def move_into_check?(end_position)
		
	end
end