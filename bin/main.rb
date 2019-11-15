#!/usr/bin/env ruby

require_relative '../lib/board.rb'
require_relative '../lib/users.rb'
require_relative '../lib/tic_tac_toe.rb'

puts "Welcome to Tic-tac-toe!"
game = TicTacToe.new

puts "Select x player name:"
game.player_x.name = gets.chomp.to_s
puts "Welcome #{game.player_x.name}"

puts "Select o player name:"
game.player_o.name = gets.chomp.to_s
puts "Welcome #{game.player_o.name}"

puts "Let's start"

winner = false
while game.turn < 9
  begin
    puts "It's #{game.current_player.name}'s turn. Select a square from #{game.board.avail_squares}"
    move = gets.chomp.to_i
    game.board.move(game.current_player.type, move) 
  rescue StandardError => e
    puts "Invalid move, try again"
    retry
  else
    game.turn += 1
    puts "Your move was added to the board"
    puts game.board.display_board
    print "Next turn in..."
    [3, 2, 1, 0].each do |i|
      sleep 0.5
      print "  " + i.to_s
    end
    puts ""
  end
  winner = game.check_winner
  if winner
    winner_name = game.current_player
    break
  else
    game.switch_player
  end
end

if game.turn > 8
    puts "It's a tie"
else
    puts "The winner is #{game.current_player.name}"
end
