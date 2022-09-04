

require './lib/board'
require './lib/game'
require './lib/player'
require 'pry'

p "Welcome to Connect Four!"
p "press p to play"

    input = gets.chomp
    input.downcase == "p"
    board = Board.new
    board.render_board
   
    game = Game.new
    game.start