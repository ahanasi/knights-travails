require_relative "board.rb"
require_relative "node.rb"
class KnightTravails

    MOVES = [[[2, 1], [2, -1], [-2, 1], [-2, -1]],[[1,2], [-1, 2], [1,-2], [-1,-2]]]
      
  def knight_moves(start_pos, end_pos)

  end

  def possible_moves(position=[3,3])
    legal_moves = []
    MOVES.each do |moves|
      moves.map do |arr|
        arr[0] += position[0]
        arr[1] += position[1]
        legal_moves << arr if (arr.all?{|val| val.between?(0,7)})   
      end
    end
    legal_moves    
  end


end

test = KnightTravails.new()
p test.possible_moves