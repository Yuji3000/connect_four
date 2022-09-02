require './lib/board'
require 'pry'

RSpec.describe Board do
  describe '#initialize_board' do
    it 'board exists' do
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end

  it 'can build cells' do 
    board = Board.new
    expect(board.cells.values[0]).to eq(".") 
    expect(board.cells.values[41]).to eq(".") 
    expect(board.cells.values[42]).to eq(nil) 

  end
  
  it 'can render a new board' do 
    board = Board.new
    expect(board.render_board).to eq(
    "ABCDEFG\n....... \n....... \n....... \n....... \n....... \n......."
      )
      

  end

  it 'can change key values based on player input' do 
    board = Board.new
    expect(board.move("a")).to be_a Hash
    expect(board.move("a").count).to eq 42
    expect(board.move("a")).to include("a1" => ".")
    expect(board.move("a")).to include("a2" => ".")
    expect(board.move("a")).to include("a3" => "X")
  end
  
  it 'tests computer move'do
    board = Board.new
    expect(board.computer_move).to be_a Hash
    expect(board.computer_move.count).to eq 42
  end
end