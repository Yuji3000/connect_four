require 'pry'
class Game
  def initialize
    @board = Board.new  
    # @name = gets.chomp
    @player = Player.new(@name)
    # @computer = Player.new
  end
  
  def start
      p 'Please enter your name:'
      @name = gets.chomp
    while @board.board_empty? == true
      
      puts "==========Connect Four=========="
      puts @board.render_board
      puts "#{@name} pick a column A to G to place your chip"
      given = gets.chomp.downcase
      
      until @board.valid_placement?(given) == true
        puts 'INVALID COLUMN. TRY AGAIN.'
        given = gets.chomp.downcase
      end
      
      if @board.valid_placement?(given) == true
        @board.player_move(given)
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

