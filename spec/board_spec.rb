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
    # expect(board.move("a")).to include("a3" => "X")
  end
  
<<<<<<< HEAD
  it 'can determin winner' do 
    board = Board.new
    board.move("a")
    board.move("a")
    board.move("a")
    board.move("a")
    expect(board.player_vertical_win("a")).to eq true
=======
  it 'tests computer move'do
    board = Board.new
    expect(board.computer_move).to be_a Hash
    expect(board.computer_move.count).to eq 42
  end

  describe '#board_full' do
    it 'stops the game when board is full' do
      board = Board.new
      board.board_full
      expect(board.cells.values).not_to eq(".")
      # expect when board is full game will stop
      # no valid columns available; i.e. the game board is full. 
      # In this case, the game is a draw, an endgame condition.
    end
>>>>>>> a20e349acce97492d8177710480def6be88a59aa
  end
end