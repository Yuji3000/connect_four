require 'pry'

class Game
  def initialize(player)
    @player = player
    
  end

  def move(given)
    cell_arr = @cells.sort.reverse
    cell_arr.find do |cell| 
      if cell[0].include?(given) && cell[1] == '.'
        cell[1] = 'X' 
        #cell[1] means 
      end
    @cells = cell_arr.to_h
  end

end