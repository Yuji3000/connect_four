require 'pry'

class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end
  
  


  def start
    while @board.board_empty?
      p "Pick column A to G to place a chip"
      given = gets.chomp 
      if [*"a".."g"].include?(given) == true 
        @board.move(given)
        # @board.render_board 
        @board.computer_move
        @board.render_board 
        @board.column_available?(given)
        
        
      elsif
        p "try again"
      end    
    end
  end
    
       
  
end

