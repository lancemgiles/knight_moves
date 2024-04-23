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

  attr_accessor :board

  def initialize
    # chess board as a cartesean plane
    # each element of the board is a row
    # each element of the row array is a cell in that row
    # so @board[0][0] is the bottom left corner, (0, 0)
    @board = Array.new(8) { Array.new(8) }
    populate
  end

  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        @board[row][col]
      end
    end
  end

  def valid_pos?(pos)
    row, col = pos
    row >= 0 && row < 8 && col >= 0 && col < 8
  end

  # return an array representing coordinates for each stop
  def move(start, target)
    # modified level-order traversal
    queue = [[start]]
    history = []

    until queue.empty?
      current_path = queue.shift
      current_pos = current_path.last

      return current_path if current_pos == target

      possible_moves(current_pos).each do |move|
        next if history.include?(move)

        new_path = current_path + [move]
        queue << new_path
        history << move
      end
    end
  end

  def locate(coords)
    @board[coords[0]][coords[1]]
  end

  def possible_moves(pos)
    # the piece must move two spaces in one axis and one in another axis
    # ex: [3, 3] can move to [1, 2], [4, 1], [2, 1], [5, 2], etc
    # apply possible moves from given position using knight's general moving ability
    possibilites = []

    POSSIBLE_MOVES.each do |move|
      new_row = pos[0] + move[0]
      new_col = pos[1] + move[1]
      possibilites << [new_row, new_col] if valid_pos?([new_row, new_col])
    end
    possibilites
  end
end

def output(path)
  puts "You made it in #{path.length - 1} moves!"
  p path
end

knight = Knight.new
output(knight.move([0, 0], [1, 2])) # expected output: [[0,0], [1,2]]
output(knight.move([0, 0], [7, 7])) # => [[0,0],[2,1],[4,2],[6,3],[7,5],[5,6],[7,7]]
