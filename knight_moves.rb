# frozen_string_literal: true

# build a function that shows the shortest possible way to get from one square to another
class Knight
  POSSIBLE_MOVES = [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1]
  ].freeze

  attr_accessor :location, :destination, :board

  def initialize
    # chess board as a cartesean plane
    # each element of the board is a row
    # each element of the row array is a cell in that row
    # so @board[0][0] is the bottom left corner, (0, 0)
    @board = Array.new(8) { Array.new(8) }
  end

  # return an array representing coordinates for each stop
  def move(start, target)
    @location = locate(start)
    @destination = locate(target)
  end

  def locate(coords)
    @board[coords[0]][coords[1]]
  end

  def possible_moves(start)
    # the piece must move two spaces in one axis and one in another axis
    # ex: [3, 3] can move to [1, 2], [4, 1], [2, 1], [5, 2], etc
  end
end

game = Board.new
knight = Knight.new
knight.move([0, 0], [1, 2]) # expected output: [[0,0], [1,2]]
knight.move([0, 0], [7, 7]) # => [[0,0],[2,1],[4,2],[6,3],[7,5],[5,6],[7,7]]
