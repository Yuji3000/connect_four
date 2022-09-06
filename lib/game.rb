require 'pry'
class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end
  
  


  def start
    while @board.board_empty? == true 
      puts "==========Connect Four=========="
      @board.render_board
      p "Pick column A to G to place a chip"
      given = gets.chomp.downcase

    until @board.valid_placement?(given) == true 
        puts 'INVALID COLUMN. TRY AGAIN.'
        given = gets.chomp.downcase
      end
      if @board.valid_placement?(given) == true  
        @board.move(given)
        @board.computer_move
      end    
  end
    sleep 1
    p '=================================='
    p '  Game Over. There is no winner.  '
    p '=================================='
    sleep 1
  end 
end

