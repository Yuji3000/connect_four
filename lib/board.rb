require 'pry'
class Board
  def initialize
    @board = grid
  end


  def grid
    puts ["ABCDEFG"]
    @cells = {}   
    (1..6).each do |i|
      ('a'..'g').each do |letter|
        @cells["#{letter}#{i}"] = "."
          # binding.pry
          print @cells["#{letter}#{i}"]
        end
      puts
      end
  end
end