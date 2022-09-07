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
      expect(board.cells.keys[41]).to eq('g6') 
      expect(board.cells.values[41]).to eq('.') 
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
      expect(board.player_move('a')).to be_a Hash
      expect(board.player_move('a').count).to eq 42
      expect(board.player_move('a')).to include('a1' => '.')
      expect(board.player_move('a')).to include('a2' => '.')
    end
  end
  
  describe '#board_empty?' do
    it 'stops the game when board is full' do
      board = Board.new
      expect(board.board_empty?).to eq true
    end
  end

  describe '#column_exists?' do  
    it 'verifies the column exists' do
      board = Board.new      
      expect(board.column_exists?('a')).to eq true
      expect(board.column_exists?('s')).to eq false
    end
  end

  describe 'column_available?' do
    it 'validates weather the column is not full' do
      board = Board.new      
      board.player_move('a')
      expect(board.column_available?('a')).to eq true
      8.times do
      board.player_move('a')
      end
      expect(board.column_available?('a')).to eq false
    end
  end

  describe '#valid_placement?' do
    it 'can verify a valid placement on baord' do
      board = Board.new      
      board.player_move('a')
      expect(board.valid_placement?('a')).to eq true
      board.player_move('z')
      expect(board.valid_placement?('z')).to eq false
      5.times do
      board.player_move("a")
      end
      expect(board.valid_placement?('a')).to eq false
    end
  end

  describe '#player_win?' do
    it 'identifies a win' do
      board = Board.new
      3.times do
      board.player_move('a')
      end 
      expect(board.player_win?('a')).to eq false
      board.player_move('a')
      board.player_move('a')
      expect(board.player_win?('a')).to eq true
    end
  end
  

  describe '#player_vertical_win?' do
    it 'can identify wins vertically' do
      board = Board.new
      expect(board.player_vertical_win?('a')).to eq false
      4.times do
      board.player_move("a")
      end 
      expect(board.player_vertical_win?('a')).to eq true
    end
  end

  describe '#player_horizontal_win?' do
    it 'can identify wins horizontally' do
      board = Board.new
      board.player_move("a")
      board.player_move("b")
      board.player_move("c")
      board.player_move("d")
      expect(board.player_horizontal_win?('a')).to eq true
    end
  end

  describe '#player_diagonal_win?' do
    it 'can identify wins diagnolly' do
      board = Board.new
      4.times do
      board.player_move("g")
      end
      expect(board.player_diagonal_win?("g")).to eq false
      3.times do
      board.player_move("f")
      end
      expect(board.player_diagonal_win?("f")).to eq false
      2.times do
      board.player_move("e")
      end
      expect(board.player_diagonal_win?("e")).to eq false
      1.times do
      board.player_move("d")
      end
      expect(board.player_diagonal_win?("d")).to eq true
    end
  end 
end

