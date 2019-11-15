# frozen_string_literal: true

# rubocop:disable Metrics/CyclomaticComplexity

class TicTacToe
  attr_reader :player_x, :player_o, :board, :turn, :current_player
  attr_writer :player_x, :player_o, :turn, :current_player

  def initialize
    @turn = 0
    @board = Board.new
    @player_x = Users.new('Luis', 'x')
    @player_o = Users.new('Carlos', 'o')
    @current_player = player_x
  end

  def check_winner
    board.rows.each do |row|
      return true if row.all?('x') || row.all?('o')
    end
    board.columns.each do |col|
      return true if col.all?('x') || col.all?('o')
    end
    board.diagonals.each do |dia|
      return true if dia.all?('x') || dia.all?('o')
    end
    false
  end

  def switch_player
    self.current_player = current_player == player_x ? player_o : player_x
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
