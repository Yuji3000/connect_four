require './lib/board'

board = Board.new

p "Welcome to Connect Four!"
p "press p to play"

    input = gets.chomp
    if input == "p"
      board = Board.new
      print board.
    end

