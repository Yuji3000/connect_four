require 'pry'

class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end

  def start
    until winner == true
    
      loop do
        p "Pick column A to G to place a chip"
        given = gets.chomp
        @board.move(given)
        @board.computer_move
        @board.render_board
      end
    end
  end

  def winner
    false
  end
end