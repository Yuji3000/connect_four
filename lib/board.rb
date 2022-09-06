require 'pry'
class Board

attr_reader :cells, :count
  # update
  def initialize
    @numbers = (1..6).to_a
    @letters = ('a'..'g').to_a
    @cells = {}
    board_cells
    count = 0
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
    print render + "\n" 
    # return render
  end
  

  def move(given) #human player
    cell_arr = @cells.sort.reverse    
    cell_arr.find do |cell| 
      cell[1] = 'X' if cell[0].include?(given) && cell[1] == '.'
      end
    @cells = cell_arr.to_h
  end

  def compare_column_to_selection(given)
    @letters.find do |letter|
      letter == given  
      end
  end

  def column_available?(given)
    column_check = compare_column_to_selection(given)
    if "a1".include?(column_check) && @cells["a1"] != "."
      p "PICK ANOTHER COLUMN!"
    elsif "b1".include?(column_check) && @cells["b1"] != "."
      p "PICK ANOTHER COLUMN!"
    elsif "c1".include?(column_check) && @cells["c1"] != "."
      p "PICK ANOTHER COLUMN!"
    elsif "d1".include?(column_check) && @cells["d1"] != "."
      p "PICK ANOTHER COLUMN!"
    elsif "e1".include?(column_check) && @cells["e1"] != "."
      p "PICK ANOTHER COLUMN!"
    elsif "f1".include?(column_check) && @cells["f1"] != "."
      p "PICK ANOTHER COLUMN!"
    elsif "g1".include?(column_check) && @cells["g1"] != "."
      p "PICK ANOTHER COLUMN!"
   end
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



end

# end
# player_cells = @cells.find_all {|k, v|  k.include?("a") && v == "X"

# @cells.sort.each do |cell|
#   cell[0][0] != unique && cell[0][1] == count+1 && cell[1] == "x" #
#   cell[0][0] == letter_count += 1  && cell[0][1] == count+1 && cell[1] == "x" #

  
  # @cells.sort[0][0][0] #letter 
  # @cells.sort[0][0][1] #number
  
  # @cells do |cell|q
  #   @letters.each do |letter|
  #   shovel frist 6 elements into array
  # check 4* cells[1] for X or o 