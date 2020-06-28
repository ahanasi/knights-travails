require_relative "node.rb"
require "pry"

class Board
  attr_accessor :board
  NUMBERS = (0..7).to_a

  def initialize()
    @board = Array.new(64) { Node.new(nil, nil, nil) }
    setup_board
  end

  def setup_board
    NUMBERS.product(NUMBERS).zip(@board) { |a, b| b.value = a }
  end
end