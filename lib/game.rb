require 'pry'
class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end
  
  


  def start
    while @board.board_empty? == true #&& winner == false
    puts "==========Connect Four=========="
      @board.render_board
      p "Pick column A to G to place a chip"
      given = gets.chomp.downcase
      until [*"a".."g"].include?(given) == true 
        puts 'INVALID COLUMN. TRY AGAIN.'
        given = gets.chomp.downcase
      end 
      if [*"a".."g"].include?(given) == true 
        @board.move(given)
        @board.column_available?(given)
        @board.computer_move
        
      end    
    end
         
    
    sleep 1
    p "Game Over. There is no winner."
    sleep 1

  end 
end

