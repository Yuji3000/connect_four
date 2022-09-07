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

  def vertical_win?(given)
    consecutive_vertical(given)
    @count == 4
  end 

  def consecutive_vertical(given)
    tester = @cells.find_all do |k, v|
      k[0].include?(given)
    end
    
    tester.each do |cell|
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

  def horizontal_win?
    @cells["a1"] && @cells["b1"] && @cells["c1"] && @cells["d1"] == "X" ||
    @cells["a2"] && @cells["b2"] && @cells["c2"] && @cells["d2"] == "X" ||
    @cells["a3"] && @cells["b3"] && @cells["c3"] && @cells["d3"] == "X" ||
    @cells["a4"] && @cells["b4"] && @cells["c4"] && @cells["d4"] == "X" ||
    @cells["a5"] && @cells["b5"] && @cells["c5"] && @cells["d5"] == "X" ||
    @cells["a6"] && @cells["b6"] && @cells["c6"] && @cells["d6"] == "X" ||
    
    @cells["b1"] && @cells["c1"] && @cells["d1"] && @cells["e1"] == "X" ||
    @cells["b2"] && @cells["c2"] && @cells["d2"] && @cells["e2"] == "X" ||
    @cells["b3"] && @cells["c3"] && @cells["d3"] && @cells["e3"] == "X" ||
    @cells["b4"] && @cells["c4"] && @cells["d4"] && @cells["e4"] == "X" ||
    @cells["b5"] && @cells["c5"] && @cells["d5"] && @cells["e5"] == "X" ||
    @cells["b6"] && @cells["c6"] && @cells["d6"] && @cells["e6"] == "X" ||

    @cells["c1"] && @cells["d1"] && @cells["e1"] && @cells["f1"] == "X" ||
    @cells["c2"] && @cells["d2"] && @cells["e2"] && @cells["f2"] == "X" ||
    @cells["c3"] && @cells["d3"] && @cells["e3"] && @cells["f3"] == "X" ||
    @cells["c4"] && @cells["d4"] && @cells["e4"] && @cells["f4"] == "X" ||
    @cells["c5"] && @cells["d5"] && @cells["e5"] && @cells["f5"] == "X" ||
    @cells["c6"] && @cells["d6"] && @cells["e6"] && @cells["f6"] == "X" ||
    @cells["c1"] && @cells["d1"] && @cells["e1"] && @cells["f1"] == "X" ||

    @cells["d1"] && @cells["e1"] && @cells["f1"] && @cells["g1"] == "X" ||
    @cells["d2"] && @cells["e2"] && @cells["f2"] && @cells["g2"] == "X" ||
    @cells["d3"] && @cells["e3"] && @cells["f3"] && @cells["g3"] == "X" ||
    @cells["d4"] && @cells["e4"] && @cells["f4"] && @cells["g4"] == "X" ||
    @cells["d5"] && @cells["e5"] && @cells["f5"] && @cells["g5"] == "X" ||
    @cells["d6"] && @cells["e6"] && @cells["f6"] && @cells["g6"] == "X" 
  end

  def diagonal_win?
    @cells["a4"] && @cells["b3"] && @cells["c2"] && @cells["d1"] == "X" ||
    @cells["a5"] && @cells["b4"] && @cells["c3"] && @cells["d2"] == "X" ||
    @cells["a6"] && @cells["b5"] && @cells["c4"] && @cells["d3"] == "X" ||
  
    @cells["b4"] && @cells["c3"] && @cells["d2"] && @cells["e1"] == "X" ||
    @cells["b5"] && @cells["c4"] && @cells["d3"] && @cells["e2"] == "X" ||
    @cells["b6"] && @cells["c5"] && @cells["d4"] && @cells["e3"] == "X" ||

    @cells["c4"] && @cells["d3"] && @cells["e2"] && @cells["f1"] == "X" ||
    @cells["c5"] && @cells["d4"] && @cells["e3"] && @cells["f2"] == "X" ||
    @cells["c6"] && @cells["d5"] && @cells["e4"] && @cells["f3"] == "X" ||

    @cells["d4"] && @cells["e3"] && @cells["f2"] && @cells["g1"] == "X" ||
    @cells["d5"] && @cells["e4"] && @cells["f3"] && @cells["g2"] == "X" ||
    @cells["d6"] && @cells["e5"] && @cells["f4"] && @cells["g3"] == "X" ||
    
    @cells["c4"] && @cells["d3"] && @cells["e2"] && @cells["f1"] == "X" ||
    @cells["c5"] && @cells["d4"] && @cells["e3"] && @cells["f2"] == "X" ||
    @cells["c6"] && @cells["d5"] && @cells["e4"] && @cells["f3"] == "X" ||
    
    @cells["a1"] && @cells["b2"] && @cells["c3"] && @cells["d4"] == "X" ||
    @cells["a2"] && @cells["b3"] && @cells["c4"] && @cells["d5"] == "X" ||
    @cells["a3"] && @cells["b4"] && @cells["c5"] && @cells["d6"] == "X" ||

    @cells["b1"] && @cells["c2"] && @cells["d3"] && @cells["e4"] == "X" ||
    @cells["b2"] && @cells["c3"] && @cells["d4"] && @cells["e5"] == "X" ||
    @cells["b3"] && @cells["c4"] && @cells["d5"] && @cells["e6"] == "X" ||

    @cells["c1"] && @cells["d2"] && @cells["d3"] && @cells["e4"] == "X" ||
    @cells["c2"] && @cells["d3"] && @cells["d4"] && @cells["e5"] == "X" ||
    @cells["c3"] && @cells["d4"] && @cells["d5"] && @cells["e6"] == "X" ||
   
    @cells["d1"] && @cells["d2"] && @cells["fd3"] && @cells["g4"] == "X" ||
    @cells["d2"] && @cells["d3"] && @cells["fd4"] && @cells["g5"] == "X" ||
    @cells["d3"] && @cells["d4"] && @cells["fd5"] && @cells["g6"] == "X"
  end
end