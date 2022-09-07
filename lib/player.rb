class Player
 
    def initialize(name = 'Player1')
     @name = name
    end

    # def player_move(given)
    #   # require 'pry'; binding.pry
    #   cell_arr = @board.cells.sort.reverse  
    #   cell_arr.find do |cell| 
    #     cell[1] = 'X' if cell[0].include?(given) && cell[1] == '.'
    #   end
    #   cells = cell_arr.to_h
    # end
end
