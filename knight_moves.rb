class BoardSquare 								
	attr_accessor :position, :path	
	def initialize(position, path)
		@position = position
		@path = path
	end
end

def knight_moves(start, finish)
	queue = [BoardSquare.new(start, [start])] 
	visited = [start]
	until queue.empty?
		current = queue.shift

		possible_moves = possible_moves(current.position).select { |move| !visited.include?(move) }
		
		if possible_moves.include?(finish)
			current.path << finish
			puts "You made it in #{current.path.size-1} moves! Here's your path:"
			current.path.each { |x,y| puts "[#{x},#{y}]"}
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
	moves.select { |move| (move[0] > -1 && move[0] < 8) && (move[1] > -1 && move[1] < 8) }.shuffle # randomized for debugging
end

puts knight_moves([3,3],[4,3])







