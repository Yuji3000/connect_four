require './lib/board'
require 'pry'



p "Welcome to Connect Four!"
p "press p to play"

    input = gets.chomp
    if input == "p"
      board = Board.new
      # binding.pry
      board.render_board
    end

