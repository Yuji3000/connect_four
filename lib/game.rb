require 'pry'

class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end

  def start
    #prompt player to place chip/select spot on board
    #check if placement is valid 
    #while board is empty. player and comp take turns
    #if board is full, end game
    #if winner is detected end game
    while @board.board_empty?
      p "Pick column A to G to place a chip"
      given = gets.chomp 
      if [*"a".."g"].include?(given) == true 
        @board.move(given)
        @board.render_board 
        @board.computer_move
        @board.render_board 
      elsif
        p "try again"
      end    
    end
  end
end