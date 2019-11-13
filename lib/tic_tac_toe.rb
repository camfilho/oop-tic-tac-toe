# frozen_string_literal: true

class TicTacToe
  def initialize
    @turn = 1
  end

  def check_winner(board)
    board.rows.each do |row|
      return true if row.all?('x') || row.all?('o')
    end
    

  end
end
