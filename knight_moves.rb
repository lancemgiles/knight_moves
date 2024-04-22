# frozen_string_literal: true

# chess board as a cartesean plane
class Board
  attr_accessor :board

  def initialize
    # each element of the board is a row
    # each element of the row array is a cell in that row
    # so @board[0][0] is the top left corner, (0, 0)
    @board = Array.new(8) { Array.new(8) }
  end
end

# build a function that shows the shortest possible way to get from one square to another
class KnightMoves
  # return an array representing coordinates for each stop
end
