require_relative "piece"

class Board 
	def initialize
		@rows = Array.new(8) { Array.new(8) }
		[0, 1, 6, 7].each do |row|
			(0..7).each do |column|
				@rows[row][column] = Piece.new
			end
		end
	end

	def [](position)
		raise "Invalid position" unless valid_position?(position)

		x, y = position
		@rows[x][y]
	end

	def []=(position, piece)
		raise "Invalid position" unless valid_position?(position)

		x, y = position 
		@rows[x][y] = piece
	end

	def move_piece(start_position, end_position)
		piece = self[start_position]
		if piece.nil?
			raise "No piece found at position #{start_position}, try again."
		end

		self[end_position] = piece
		self[start_position] = nil 

		nil
	end

	def valid_position?(position)
		position.all? { |coordinate| coordinate.between?(0, 7) }
	end

	private 

end