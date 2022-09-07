require './lib/board'
require './lib/game'
require './lib/player'
require 'pry'

loop do
  p '=====Welcome to CONNECT FOUR====='
  p 'Enter p to play. Enter q to quit.'
    input = gets.chomp.downcase
    
    until input == "p" || input == "q"
      puts "Invalid input. \n" + "Enter p to play. Enter q to quit."
      input = gets.chomp.downcase
    end
    
    if input == "p"
      game = Game.new
      game.start
    else
      puts "Goodbye!"
      break
    end

end
