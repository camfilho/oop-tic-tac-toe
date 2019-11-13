#!/usr/bin/env ruby

require '../lib/tic_tac_toe.rb'

puts "Welcome to Tic-tac-toe!"
game = TicTacToe.new

puts "Input x player name:"
game.player_x.name = gets.chomp
puts "Welcome #{game.player_x.name}"

puts "Input o player name:"
game.player_o.name = gets.chomp
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