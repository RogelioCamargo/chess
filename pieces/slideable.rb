module Slideable
	HORIZONTAL_AND_VERTICAL_DIRECTIONS = [
		[-1, 0], [1, 0],
		[0, -1], [0, 1]
	].freeze

	DIAGONAL_DIRECTIONS = [
		[-1, -1], [-1, 1],
		[ 1,  1], [1, -1]
	].freeze

	def horizontal_and_vertical_directions 
		HORIZONTAL_AND_VERTICAL_DIRECTIONS
	end

	def diagonal_directions
		DIAGONAL_DIRECTIONS
	end

	def moves 
		moves = []
		move_directions.each do |dx, dy|
			moves.concat(get_unblocked_moves_in_direction(dx, dy))
		end
		moves 
	end

	private 

	def move_directions
		raise NotImplementedError
	end

	def get_unblocked_moves_in_direction(dx, dy)
		current_x, current_y = position 
		moves = []

		loop do 
			current_x, current_y = current_x + dx, current_y + dy 
			new_position = [current_x, current_y]
			
			break unless board.valid_position?(new_position)

			if board.empty?(new_position)
				moves << new_position
			else 
				moves << new_position if board[position].color != color
				break
			end
		end

		moves 
	end
end