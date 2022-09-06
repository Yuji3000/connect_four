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

  def vertical_win
    count = 0
    if count == 4
      p true
    else
      #vertical
      @cells.to_a.each_slice(6).each do |cell|
        cell.each_cons do |index|
          require 'pry'; binding.pry
        
        if index[1] == "X"
          count += 1
        else
          count = 0
        end
      end
      end
    end
  end

  def horizontal_win
    count = 0
    if count == 4
      p true
    else
      #horizontal
      @cells.sort.each_slice(7).each do |cell|
        cell.each do |index|        
        if index[1] == "X"
          count += 1
        else
          count = 0
        end
      end
      end
    end
  end

  def diagnol_win
    count = 0
    if count == 4
      p true
    else
      #horizontal
      @cells.sort.each_slice(7).each do |cell|
        cell.each_cons do |index|   
               require 'pry'; binding.pry
        if index[1] == "X"
          count += 1
        else
          count = 0
        end
      end
      end
    end
  end
  
# def player_win?
#   horizontal_win == true || vertical_win == true || diagnal_win == true
# end
  #   count = 0
    cell_arr = @cells.sort.reverse
    until count == 4
      cell_arr.find do |cell| 
        if cell[0].include?("given") && cell[1] == "X"
          count += 1
        else 
          count = 0
        end
  #     end
  #     cell_arr.find do |cell| 
  #       if cell[1].include? && cell[1] == "X"
  #         count += 1
  #       else 
  #         count = 0
  #       end
  #     end
  #   end
  #       # puts "Game Over. Player 1 has won the game"
  # end

  def column_exits?(given)
    [*"a".."g"].include?(given)
  end

  def column_full(given)
    cell_arr = @cells.sort.reverse
    cell_arr.find_all do |cell| 
     cell[0][0] == given && cell[1] == "."
    end.count
  end

  def valid_placement?(given)
    column_exits?(given) == true && (column_full(given) != 0) == true
  
  end


  # def compare_column_to_selection(given)
  #   @letters.find do |letter|
  #     letter == given  
  #     end
  # end

  def column_available?(given)
    if "a1".include?(given) && @cells["a1"] != "." ||
     "b1".include?(given) && @cells["b1"] != "." ||
     "c1".include?(given) && @cells["c1"] != "." ||
     "d1".include?(given) && @cells["d1"] != "." ||
     "e1".include?(given) && @cells["e1"] != "." ||
     "f1".include?(given) && @cells["f1"] != "." ||
     "g1".include?(given) && @cells["g1"] != "." ||
   end
   false
  else 
   true
  end

end