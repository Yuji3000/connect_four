require 'pry'

class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end

  def start
    p "Pick column A to G to place a chip"
        # given = gets.chomp 
            while given = gets.chomp
              if [*"a".."g"].include?(given) == true 
                @board.move(given)
                @board.computer_move
                @board.render_board 
              elsif
                p "try again"
              end    
            end
                
  end
end