#!/usr/bin/env ruby

puts "Welcome to Tic-tac-toe!"

puts "Input x player name:"
x_player = gets.chomp
puts "Welcome #{x_player}"

puts "Input o player name:"
o_player = gets.chomp
puts "Welcome #{o_player}"

puts "Let's start"

turn = 0
winner = false
while turn < 9
  begin
    puts "It's #{current_player}'s turn. Select a square from #{available_squares}"
    move = gets.chomp
    add_move(move)
  rescue => exception
      puts "Invalid move, try again"
      retry
  else
    turn += 1
    puts "Your move was added to the board"
    puts display_board
  end
 
  winner = check_winner(current_player)
  
  if winner
    winner_name = current_player
    break
  else
    switch_player
  end
end

if turn > 8
    puts "It's a tie"
else 
    puts "The winner is #{current_player}"
end