require_relative "board.rb"
require_relative "node.rb"
require "pry"

class KnightTravails
  attr_accessor :board
  MOVES_1 = [[2, 1], [2, -1], [-2, 1], [-2, -1]]
  MOVES_2 = [[1, 2], [-1, 2], [1, -2], [-1, -2]]

  def initialize()
    @board = Board.new().board
  end

  def knight_moves(start_pos = [0, 0], end_pos = [3, 3])
    queue = []
    queue << Node.new(start_pos)

    until queue.empty?
      current = queue[0]
      binding.pry
      current.children << possible_moves(current.value).map { |arr| binding.pry; Node.new(arr, current) }
      current.children.flatten!
      binding.pry
      if current.children.any? { |node| node.value == end_pos }
        break
      else
        queue << current.children
        queue.flatten!
        binding.pry
        queue.shift
      end
    end
    binding.pry
  end

  def possible_moves(position)
    moves = []
    
    MOVES_1.each do |arr|
      moves << position.map.with_index { |val, i| val += arr[i] }
    end

    MOVES_2.each do |arr|
      moves << position.map.with_index { |val, i| val += arr[i] }
    end
    moves
  end

  def valid_moves(all_moves)
    all_moves.select { |arr| arr if (arr.all? { |val| (val >= 0 && val < 8) }) }
  end
end

test = KnightTravails.new()
binding.pry
