require_relative "node.rb"
require "pry"

class Board
  attr_accessor :board
  LABELS = ("0".."7").to_a

  def initialize()
    @board = Array.new(8, ".").map { |row| Array.new(8, ".") }
  end

  def display_board()
    print "\t"
    print LABELS.join("\t")
    puts
    @board.each_with_index do |row, i|
      print LABELS[i]
      print "\t"
      print row.join("\t")
      puts
    end
  end
end
