class BoardSquare 								
	attr_accessor :position, :path	
	def initialize(position, path)
		@position = position
		@path = path
	end
end

def knight_moves(start, finish)
	return "You entered an invalid starting position" unless is_valid_position?(start) 
	return "You entered an invalid ending position" unless is_valid_position?(finish)
	return "You're already on that position!" if start == finish
	queue = [BoardSquare.new(start, [start])] 
	visited = [start]
	until queue.empty?
		current = queue.shift

		possible_moves = possible_moves(current.position).select { |move| !visited.include?(move) }
		
		if possible_moves.include?(finish)
			current.path << finish
			if current.path.size-1 == 1
				puts "You made it in #{current.path.size-1} move! Here's your path:"
			else
				puts "You made it in #{current.path.size-1} moves! Here's your path"
			end
			current.path.each { |pos| p pos }
			return
		end
		
		possible_moves.each do |move|
			queue << BoardSquare.new(move, (current.path + [move]))
			visited << move
		end

	end
end

def possible_moves(pos)
	changes = [[-2,-1],[-2,1],[-1,-2],[-1,2],[2,-1],[2,1],[1,-2],[1,2]]
	moves = []
	changes.each { |change| moves << [pos[0]+change[0], pos[1]+change[1]] }
	moves.select { |move| is_valid_position?(move) }
end

def is_valid_position?(pos)
	return (pos[0] > -1 && pos[0] < 8) && (pos[1] > -1 && pos[1] < 8) ? true : false
end

puts knight_moves([3,3],[4,3])








