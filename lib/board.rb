require 'pry'
class Board

attr_reader :cells, :count
  def initialize
    @numbers = (1..6).to_a
    @letters = ('a'..'g').to_a
    @cells = {}
    board_cells
    @count = 0
  end 
  
  def board_cells
    @numbers.each do |number|
      @letters.each do |letter|
        @cells["#{letter}#{number}"] = ('.')
      end
    end.reverse
  end
  
  def render_board
    render = "ABCDEFG\n" +
    @cells["a1"] + @cells["b1"] + @cells["c1"] + @cells["d1"] + @cells["e1"] + @cells["f1"] + @cells["g1"] + " \n" +
    @cells["a2"] + @cells["b2"] + @cells["c2"] + @cells["d2"] + @cells["e2"] + @cells["f2"] + @cells["g2"] + " \n" +
    @cells["a3"] + @cells["b3"] + @cells["c3"] + @cells["d3"] + @cells["e3"] + @cells["f3"] + @cells["g3"] + " \n" +
    @cells["a4"] + @cells["b4"] + @cells["c4"] + @cells["d4"] + @cells["e4"] + @cells["f4"] + @cells["g4"] + " \n" +
    @cells["a5"] + @cells["b5"] + @cells["c5"] + @cells["d5"] + @cells["e5"] + @cells["f5"] + @cells["g5"] + " \n" +
    @cells["a6"] + @cells["b6"] + @cells["c6"] + @cells["d6"] + @cells["e6"] + @cells["f6"] + @cells["g6"]
    return render
  end
  
  def player_move(given) #human player
    cell_arr = @cells.sort.reverse  
    cell_arr.find do |cell| 
      cell[1] = 'X' if cell[0].include?(given) && cell[1] == '.'
    end
    @cells = cell_arr.to_h
  end
  
  def column_exists?(given)
    [*"a".."g"].include?(given) 
  end
  
  def valid_placement?(given)
    column_exists?(given)
    column_available?(given)
  end 

  def column_available?(given)
    "a1".include?(given) && @cells["a1"] == "." ||
    "b1".include?(given) && @cells["b1"] == "." ||
    "c1".include?(given) && @cells["c1"] == "." ||
    "d1".include?(given) && @cells["d1"] == "." ||
    "e1".include?(given) && @cells["e1"] == "." ||
    "f1".include?(given) && @cells["f1"] == "." ||
    "g1".include?(given) && @cells["g1"] == "."
  end

  def board_empty?
    @cells.values.any?('.')
  end

  def computer_move #computer player
    computer_choice = [*"a".."g"].sample
    cell_arr = @cells.sort.reverse
    cell_arr.find do |cell| 
      cell[1] = 'O' if cell[0].include?(computer_choice) && cell[1] == '.'
    end
    @cells = cell_arr.to_h
  end

  def player_win?(given)
    counter = 0
    player_vertical_win?(given) == true || 
    player_horizontal_win?(given) == true ||
    player_diagonal_win?(given) == true
  end

  def player_vertical_win?(given)
    count = 0
    player_consecutive_vertical(given)
    @count == 4
  end 

  def player_consecutive_vertical(given)
    cells_avail = @cells.find_all do |k, v|
      k[0].include?(given)
    end
    
    count = 0

    cells_avail.each do |cell|
      if cell[1] == "X"
        @count = @count += 1 
      else
        @count = 0
      end 
      if @count == 4
        break
      end
    end    
  end
  
  def player_horizontal_win?(given)
    player_consecutive_horizontal(given)
    count == 4
  end

  def player_consecutive_horizontal(given)
    count = 0
    cells_hor = @cells.sort_by {|cell| [cell[0][1], cell[0][0]]}
    combinations = cells_hor.each_cons(4).to_a.delete_if do |cell| 
      cell[0][0].include?('g') || 
      cell[0][0].include?('e') || 
      cell[0][0].include?('f')
    end

    combinations.each do |cell|
      if cell[0][1] == "X"
        @count = @count += 1 
      else
        @count = 0
      end 
      if @count == 4
        break
      end
    end    
  end
  
    # require 'pry'; binding.pry
  #   @cells["a1"] && @cells["b1"] && @cells["c1"] && @cells["d1"] == "X" ||
  #   @cells["a2"] && @cells["b2"] && @cells["c2"] && @cells["d2"] == "X" ||
  #   @cells["a3"] && @cells["b3"] && @cells["c3"] && @cells["d3"] == "X" ||
  #   @cells["a4"] && @cells["b4"] && @cells["c4"] && @cells["d4"] == "X" ||
  #   @cells["a5"] && @cells["b5"] && @cells["c5"] && @cells["d5"] == "X" ||
  #   @cells["a6"] && @cells["b6"] && @cells["c6"] && @cells["d6"] == "X" ||
    
  #   @cells["b1"] && @cells["c1"] && @cells["d1"] && @cells["e1"] == "X" ||
  #   @cells["b2"] && @cells["c2"] && @cells["d2"] && @cells["e2"] == "X" ||
  #   @cells["b3"] && @cells["c3"] && @cells["d3"] && @cells["e3"] == "X" ||
  #   @cells["b4"] && @cells["c4"] && @cells["d4"] && @cells["e4"] == "X" ||
  #   @cells["b5"] && @cells["c5"] && @cells["d5"] && @cells["e5"] == "X" ||
  #   @cells["b6"] && @cells["c6"] && @cells["d6"] && @cells["e6"] == "X" ||

  #   @cells["c1"] && @cells["d1"] && @cells["e1"] && @cells["f1"] == "X" ||
  #   @cells["c2"] && @cells["d2"] && @cells["e2"] && @cells["f2"] == "X" ||
  #   @cells["c3"] && @cells["d3"] && @cells["e3"] && @cells["f3"] == "X" ||
  #   @cells["c4"] && @cells["d4"] && @cells["e4"] && @cells["f4"] == "X" ||
  #   @cells["c5"] && @cells["d5"] && @cells["e5"] && @cells["f5"] == "X" ||
  #   @cells["c6"] && @cells["d6"] && @cells["e6"] && @cells["f6"] == "X" ||
  #   @cells["c1"] && @cells["d1"] && @cells["e1"] && @cells["f1"] == "X" ||

  #   @cells["d1"] && @cells["e1"] && @cells["f1"] && @cells["g1"] == "X" ||
  #   @cells["d2"] && @cells["e2"] && @cells["f2"] && @cells["g2"] == "X" ||
  #   @cells["d3"] && @cells["e3"] && @cells["f3"] && @cells["g3"] == "X" ||
  #   @cells["d4"] && @cells["e4"] && @cells["f4"] && @cells["g4"] == "X" ||
  #   @cells["d5"] && @cells["e5"] && @cells["f5"] && @cells["g5"] == "X" ||
  #   @cells["d6"] && @cells["e6"] && @cells["f6"] && @cells["g6"] == "X" 
  # end

  

  def player_diagonal_win?(given)
    @cells["a4"] == "X" && @cells["b3"] == "X" && @cells["c2"] == "X" && @cells["d1"] == "X" ||
    @cells["a5"] == "X" && @cells["b4"] == "X" && @cells["c3"] == "X" && @cells["d2"] == "X" ||
    @cells["a6"] == "X" && @cells["b5"] == "X" && @cells["c4"] == "X" && @cells["d3"] == "X" ||
  
    @cells["b4"] == "X" && @cells["c3"] == "X" && @cells["d2"] == "X" && @cells["e1"] == "X" ||
    @cells["b5"] == "X" && @cells["c4"] == "X" && @cells["d3"] == "X" && @cells["e2"] == "X" ||
    @cells["b6"] == "X" && @cells["c5"] == "X" && @cells["d4"] == "X" && @cells["e3"] == "X" ||

    @cells["c4"] == "X" && @cells["d3"] == "X" && @cells["e2"] == "X" && @cells["f1"] == "X" ||
    @cells["c5"] == "X" && @cells["d4"] == "X" && @cells["e3"] == "X" && @cells["f2"] == "X" ||
    @cells["c6"] == "X" && @cells["d5"] == "X" && @cells["e4"] == "X" && @cells["f3"] == "X" ||

    @cells["d4"] == "X" && @cells["e3"] == "X" && @cells["f2"] == "X" && @cells["g1"] == "X" ||
    @cells["d5"] == "X" && @cells["e4"] == "X" && @cells["f3"] == "X" && @cells["g2"] == "X" ||
    @cells["d6"] == "X" && @cells["e5"] == "X" && @cells["f4"] == "X" && @cells["g3"] == "X" ||
    
    @cells["c4"] == "X" && @cells["d3"] == "X" && @cells["e2"] == "X" && @cells["f1"] == "X" ||
    @cells["c5"] == "X" && @cells["d4"] == "X" && @cells["e3"] == "X" && @cells["f2"] == "X" ||
    @cells["c6"] == "X" && @cells["d5"] == "X" && @cells["e4"] == "X" && @cells["f3"] == "X" ||
    
    @cells["a1"] == "X" && @cells["b2"] == "X" && @cells["c3"] == "X" && @cells["d4"] == "X" ||
    @cells["a2"] == "X" && @cells["b3"] == "X" && @cells["c4"] == "X" && @cells["d5"] == "X" ||
    @cells["a3"] == "X" && @cells["b4"] == "X" && @cells["c5"] == "X" && @cells["d6"] == "X" ||

    @cells["b1"] == "X" && @cells["c2"] == "X" && @cells["d3"] == "X" && @cells["e4"] == "X" ||
    @cells["b2"] == "X" && @cells["c3"] == "X" && @cells["d4"] == "X" && @cells["e5"] == "X" ||
    @cells["b3"] == "X" && @cells["c4"] == "X" && @cells["d5"] == "X" && @cells["e6"] == "X" ||

    @cells["c1"] == "X" && @cells["d2"] == "X" && @cells["d3"] == "X" && @cells["e4"] == "X" ||
    @cells["c2"] == "X" && @cells["d3"] == "X" && @cells["d4"] == "X" && @cells["e5"] == "X" ||
    @cells["c3"] == "X" && @cells["d4"] == "X" && @cells["d5"] == "X" && @cells["e6"] == "X" ||
   
    @cells["d1"] == "X" && @cells["d2"] == "X" && @cells["fd3" == "X"] && @cells["g4"] == "X" ||
    @cells["d2"] == "X" && @cells["d3"] == "X" && @cells["fd4" == "X"] && @cells["g5"] == "X" ||
    @cells["d3"] == "X" && @cells["d4"] == "X" && @cells["fd5" == "X"] && @cells["g6"] == "X"
  end

  def computer_diagonal_win?(given)
    @cells["a4"] == "O" && @cells["b3"] == "O" && @cells["c2"] == "O" && @cells["d1"] == "O" ||
    @cells["a5"] == "O" && @cells["b4"] == "O" && @cells["c3"] == "O" && @cells["d2"] == "O" ||
    @cells["a6"] == "O" && @cells["b5"] == "O" && @cells["c4"] == "O" && @cells["d3"] == "O" ||
  
    @cells["b4"] == "O" && @cells["c3"] == "O" && @cells["d2"] == "O" && @cells["e1"] == "O" ||
    @cells["b5"] == "O" && @cells["c4"] == "O" && @cells["d3"] == "O" && @cells["e2"] == "O" ||
    @cells["b6"] == "O" && @cells["c5"] == "O" && @cells["d4"] == "O" && @cells["e3"] == "O" ||

    @cells["c4"] == "O" && @cells["d3"] == "O" && @cells["e2"] == "O" && @cells["f1"] == "O" ||
    @cells["c5"] == "O" && @cells["d4"] == "O" && @cells["e3"] == "O" && @cells["f2"] == "O" ||
    @cells["c6"] == "O" && @cells["d5"] == "O" && @cells["e4"] == "O" && @cells["f3"] == "O" ||

    @cells["d4"] == "O" && @cells["e3"] == "O" && @cells["f2"] == "O" && @cells["g1"] == "O" ||
    @cells["d5"] == "O" && @cells["e4"] == "O" && @cells["f3"] == "O" && @cells["g2"] == "O" ||
    @cells["d6"] == "O" && @cells["e5"] == "O" && @cells["f4"] == "O" && @cells["g3"] == "O" ||
    
    @cells["c4"] == "O" && @cells["d3"] == "O" && @cells["e2"] == "O" && @cells["f1"] == "O" ||
    @cells["c5"] == "O" && @cells["d4"] == "O" && @cells["e3"] == "O" && @cells["f2"] == "O" ||
    @cells["c6"] == "O" && @cells["d5"] == "O" && @cells["e4"] == "O" && @cells["f3"] == "O" ||
    
    @cells["a1"] == "O" && @cells["b2"] == "O" && @cells["c3"] == "O" && @cells["d4"] == "O" ||
    @cells["a2"] == "O" && @cells["b3"] == "O" && @cells["c4"] == "O" && @cells["d5"] == "O" ||
    @cells["a3"] == "O" && @cells["b4"] == "O" && @cells["c5"] == "O" && @cells["d6"] == "O" ||

    @cells["b1"] == "O" && @cells["c2"] == "O" && @cells["d3"] == "O" && @cells["e4"] == "O" ||
    @cells["b2"] == "O" && @cells["c3"] == "O" && @cells["d4"] == "O" && @cells["e5"] == "O" ||
    @cells["b3"] == "O" && @cells["c4"] == "O" && @cells["d5"] == "O" && @cells["e6"] == "O" ||

    @cells["c1"] == "O" && @cells["d2"] == "O" && @cells["d3"] == "O" && @cells["e4"] == "O" ||
    @cells["c2"] == "O" && @cells["d3"] == "O" && @cells["d4"] == "O" && @cells["e5"] == "O" ||
    @cells["c3"] == "O" && @cells["d4"] == "O" && @cells["d5"] == "O" && @cells["e6"] == "O" ||
   
    @cells["d1"] == "O" && @cells["d2"] == "O" && @cells["fd3"] == "O" && @cells["g4"] == "O" ||
    @cells["d2"] == "O" && @cells["d3"] == "O" && @cells["fd4"] == "O" && @cells["g5"] == "O" ||
    @cells["d3"] == "O" && @cells["d4"] == "O" && @cells["fd5"] == "O" && @cells["g6"] == "O"
  end
end
