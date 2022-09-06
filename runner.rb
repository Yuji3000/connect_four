

require './lib/board'
require './lib/game'
require './lib/player'
require 'pry'

loop do
p "Welcome to CONNECT FOUR"
p "Enter p to play. Enter q to quit."
  input = gets.chomp
  until input.downcase == "p" || input.downcase == "q"
    puts "Invalid input. \n" + "Enter p to play. Enter q to quit."
    input = gets.chomp
  end

  if input == "p"
      # board = Board.new
    game = Game.new
    game.start
    # if computer_won?
    #   puts "Game Over. Computer Won!"
    # elsif player_won?
    #   puts "Game Over. You Won!"
    # else
    #   puts "Game Over. No Winner!"
    # end 
  else
    puts "Goodbye!"
    break
  end

end
