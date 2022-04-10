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
		x, y = position
		@rows[x][y]
	end

	def []=(position)
		x, y = position 
		@rows[x][y]
	end

	def move_piece(start_position, end_position)
		p start_position 
		puts 
		p end_position
		if self[start_position].nil?
			raise "No piece found at position #(start_position), try again."
		end
		self[end_position] = self[start_position]
		self[start_position] = nil 
	end

	private 

end