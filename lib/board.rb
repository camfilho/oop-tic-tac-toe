class Board
  attr_accessor :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    i = 1
    board.each do |item|
      print " " + item.to_s + " |"
      i += 1
      if i > 3
        print "\n"
        i = 1
      end
    end
  end

  def move(type, coordinate)
    board[coordinate - 1] = type
  end
end

board = Board.new
board.display_board
