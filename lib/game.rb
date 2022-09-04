require 'pry'

class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end

  def start
    p "Pick column A to G to place a chip"
          while given = gets.chomp
            # binding.pry
            if [*"a".."g"].include?(given) == true
              @board.move(given)
              @board.computer_move
              @board.render_board
            else 
              p "try again"
            end
          end
  end

  # def winner
    
  # end
end