module Stepable
	def moves 
		move_directions.each_with_object([]).each do |(dx, dy), moves|
			current_x, current_y = position 
			new_position = [current_x + dx, current_y + dy]

			next unless board.valid_position?(new_position)

			if board[new_position].nil? 
				moves << new_position
			elsif board[new_position].color != color 
				moves << new_position
			end
		end
	end

	private 

	def move_directions
		raise NotImplementedError
	end

end