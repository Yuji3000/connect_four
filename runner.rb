require './lib/board'
require 'pry'



p "Welcome to Connect Four!"
p "press p to play"

    input = gets.chomp
    if input.downcase == "p"
      board = Board.new
      board.render_board
    end

