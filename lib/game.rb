require 'pry'
class Game
  def initialize
    @board = Board.new  
    @player = Player.new(@name)
    @computer = Player.new('computer')
  end
  
  def start
      p 'Please enter your name:'
      @name = gets.chomp
      while @board.board_empty? == true
        puts "==========Connect Four=========="
        puts @board.render_board
        puts "#{@name} pick a column A to G to place your chip"
        given = gets.chomp.downcase
        computer_choice = [*"a".."g"].sample
        until @board.valid_placement?(given) == true
          puts 'INVALID COLUMN. TRY AGAIN.'
          given = gets.chomp.downcase
        end
        if @board.valid_placement?(given) == true
          @board.player_move(given)
          if @board.player_win?(given) == true
            puts @board.render_board
            puts "Congratulations, You Won!"
            break 
          end 
          @board.computer_move(computer_choice)
          if @board.computer_win?(computer_choice) == true
            puts @board.render_board
            puts "Game Over. Computer Won!"
            break
          end
        end
      end
      if @board.board_empty? == false
        p '=================================='
        p '  Game Over. There is no winner.  '
        p '=================================='
      end
    end
end

