require 'pry'

class Game
  def initialize
    # @player1 = Player.new
    # @computer = Player.new
    @board = Board.new
    
  end

  def start

    loop do
      p "Pick column A to G to place a chip"
      given = gets.chomp.upcase
      #  if ("A..G").include?(given)
      binding.pry
        @board.move(given)
        @board.render_board
      break
    end
  end

end