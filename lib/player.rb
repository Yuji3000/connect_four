require 'pry'

# attr_reader :name

class Player

    def initialize(name)
      @player1 = Player.new(name)
      @player2 = Player.new(name)
      @board = Board.new
    end

    def player_move(given)
      # require 'pry'; binding.pry
      cell_arr = @board.cells.sort.reverse  
      cell_arr.find do |cell| 
        cell[1] = 'X' if cell[0].include?(given) && cell[1] == '.'
      end
      cells = cell_arr.to_h
    end
end