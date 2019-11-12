class Board
  attr_accessor :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
      puts " "
      puts " #{board[0]}  |  #{board[1]}  |  #{board[2]}"
      puts "----|-----|-----"
      puts " #{board[3]}  |  #{board[4]}  |  #{board[5]}"
      puts "----|-----|-----"
      puts " #{board[6]}  |  #{board[7]}  |  #{board[8]}"
      puts " "
  end

  def move(type, coordinate)
    if empty?(coordinate)
      board[coordinate - 1] = type
      display_board
    else
      raise "Exception: Coordinate not Empty"
    end
  end

  def empty?(coordinate)
    if board[coordinate - 1] == "x" || board[coordinate - 1] == "o"
      return false
    else
      true
    end
  end

end


board = Board.new
board.display_board
board.move("x",5)
board.move("o",1)
board.move("x",5)


