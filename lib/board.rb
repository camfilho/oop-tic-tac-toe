# frozen_string_literal: true

class Board
  attr_accessor :board, :avail_squares

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @avail_squares = board.dup
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

  def rows
    row1 = [board[0], board[1], board[2]]
    row2 = [board[3], board[4], board[5]]
    row3 = [board[6], board[7], board[8]]
    [row1, row2, row3]
  end

  def columns
    col1 = [board[0], board[3], board[6]]
    col2 = [board[1], board[4], board[7]]
    col3 = [board[2], board[5], board[8]]
    [col1, col2, col3]
  end

  def diagonals
    diagonal1 = [board[0], board[4], board[8]]
    diagonal2 = [board[2], board[4], board[6]]
    [diagonal1, diagonal2]
  end

  def move(type, coordinate)
    if empty?(coordinate)
      board[coordinate - 1] = type
      display_board
      avail_squares.delete(coordinate)
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


