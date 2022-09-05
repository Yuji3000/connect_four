

require './lib/board'
require './lib/game'
require './lib/player'
require 'pry'

p "Welcome to CONNECT FOUR"
p "Enter p to play. Enter q to quit."

    input = gets.chomp
    if input.downcase == "p"
        board = Board.new
        board.render_board
        game = Game.new
        game.start
    elsif input.downcase == "q"
        abort("BYE!")
    end

   
    # input = gets.chomp
    # if input.downcase == "q"
    #     abort("THANK YOU FOR PLAYING!")
    # end