require_relative "board.rb"
require_relative "node.rb"
require "pry"

class KnightTravails
  MOVES_1 = [[2, 1], [2, -1], [-2, 1], [-2, -1]]
  MOVES_2 = [[1, 2], [-1, 2], [1, -2], [-1, -2]]

  def initialize()
    @board = Board.new()
  end

  def knight_moves(start_pos, end_pos)
    return [start_pos] if (start_pos == end_pos)
    queue = []
    result = [end_pos]
    queue << Node.new(start_pos)

    until queue.empty?
      current = queue[0]
      current.children << valid_moves(possible_moves(current.value)).map { |arr| Node.new(arr, current) }
      current.children.flatten!
      if current.children.any? { |node| node.value == end_pos }
        until current == nil
          result << current.value
          current = current.parent
        end
        return result.reverse!
      else
        queue << current.children
        queue.flatten!
        queue.shift
      end
    end
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

  def driver()
    start = ""
    end_cd = ""

    banner = File.read("lib/banner.txt")
    puts banner + "\n\n"

    @board.display_board()
    puts "\nPlease enter the start coordinates for your knight. (E.g. row,column --> 0,0)"

    until start.match(/^[0-7],[0-7]$/)
      start = gets.chomp
    end
    start = start.split(",").map(&:to_i)

    @board.board[start[0]][start[1]] = "♞"
    @board.display_board()

    puts "\nPlease enter the end coordinates for your knight. (E.g. row,column --> 0,0)"
    until end_cd.match(/^[0-7],[0-7]$/)
      end_cd = gets.chomp
    end
    end_cd = end_cd.split(",").map!(&:to_i)

    @board.board[start[0]][start[1]] = "."

    result = knight_moves(start, end_cd)
    result.each { |arr| @board.board[arr[0]][arr[1]] = "♞"}
    @board.display_board()

    puts "You made it in #{result.length - 1} move(s)! Here is your path: "
    result.each { |arr| p arr }
  end
end

game = KnightTravails.new()
game.driver
