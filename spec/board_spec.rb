require './lib/board'
require 'pry'

RSpec.describe Board do
  describe '#initialize_board' do
    it 'board exists' do
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end

    it 'can create cells' do 
      board = Board.new
      expect(board.cells.keys[41]).to eq("g6") 
      expect(board.cells.values[41]).to eq(".") 
      expect(board.cells.values[42]).to eq(nil) 
    end
  end
  
  describe 'board functions' do 
    it 'can render a new board' do 
      board = Board.new
      expect(board.render_board).to eq(
      "ABCDEFG\n....... \n....... \n....... \n....... \n....... \n......."
        )
    end
  end

  describe 'can make player moves' do 
    it 'can change key values based on player input' do 
      board = Board.new
      expect(board.player_move("a")).to be_a Hash
      expect(board.player_move("a").count).to eq 42
      expect(board.player_move("a")).to include("a1" => ".")
      expect(board.player_move("a")).to include("a2" => ".")
      # expect(board.move("a")).to include("a3" => "X")
    end
    
    it 'tests computer move'do
      board = Board.new
      expect(board.computer_move).to be_a Hash
      expect(board.computer_move.count).to eq 42
    end
  end

  describe '#board_full' do
    it 'stops the game when board is full' do
      board = Board.new
      expect(board.board_empty?).to eq true
      # expect when board is full game will stop
      # no valid columns available; i.e. the game board is full. 
      # In this case, the game is a draw, an endgame condition.
    end

    it 'verifies the column exists' do
      board = Board.new      
      expect(board.column_exits?('a')).to eq true
      expect(board.column_exits?('s')).to eq false
    end

    it 'validates weather the column is not full' do
      board = Board.new      
      3.times do
      board.player_move("a")
      end
      expect(board.column_full('a')).to eq 3
      board.player_move("a")
      board.player_move("a")
      expect(board.column_full('a')).to eq 1
    end

    it 'can verify a valid placement on baord' do
      board = Board.new      

      5.times do
      board.player_move("a")
      end
      expect(board.valid_placement?('a')).to eq true
      board.player_move("a")
      expect(board.valid_placement?('a')).to eq false
    end

    xit 'can identify a vertical win' do
      board = Board.new
      # expect(board.player_win).to eq false
      
      3.times do
      board.player_move("a")
      end 
      board.player_move("a")
      board.player_move("a")

      expect(board.player_win?).to eq true
    end
  end 
end 
