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
  puts "#{x_player}, it's your turn. Select a square from 1 to 9"
  move = gets.chomp
  turn += 1
  puts "Your move was added to the board"
  if winner
    winner_name = x_player
    break
  end

  puts "#{o_player}, it's your turn. Select a square from 1 to 9"
  move = gets.chomp
  turn += 1
  puts "Your move was added to the board"
  if winner
    winner_name = o_player
    break
  end
end

if turn > 8
    puts "It's a tie"
else 
    puts "The winner is #{winner_name}"
end