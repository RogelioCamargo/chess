require_relative "pieces"

class Board 
	attr_reader :rows 
	def initialize
		@sentinel = NullPiece.instance
		construct_starting_board
	end

	def [](position)
		raise "Invalid position" unless valid_position?(position)

		row, col = position
		@rows[row][col]
	end

	def []=(position, piece)
		raise "Invalid position" unless valid_position?(position)

		row, col = position 
		@rows[row][col] = piece
	end

	def move_piece(turn_color, start_position, end_position)
		raise "Start position is empty" if empty?(start_position)

		piece = self[start_position]
		if piece.color != turn_color
			raise "You must move your own piece"
		elsif !piece.moves.include?(end_position)
			raise "Piece does not move like that"
		end

		self[end_position] = piece
		self[start_position] = nil 

		nil
	end

	def add_piece(piece, position)
		raise "Position is not empty" unless empty?(position)
		self[position] = piece
	end

	def valid_position?(position)
		position.all? { |coordinate| coordinate.between?(0, 7) }
	end

	def empty?(position)
		self[position].empty?
	end

	private 

	attr_reader :sentinel

	def fill_back_row(color)
		back_pieces = [
			Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
		]

		i = (color == :white ? 7 : 0)
		back_pieces.each_with_index do |piece_class, j|
			piece_class.new(color, self, [i, j])
		end
	end

	def fill_front_row(color)
		i = (color == :white ? 6 : 1)
		8.times { |j| Pawn.new(color, self, [i, j]) }
	end

	def construct_starting_board
		@rows = Array.new(8) { Array.new(8, sentinel) }
		%i(black white).each do |color|
			fill_back_row(color)
			fill_front_row(color)
		end
	end

end