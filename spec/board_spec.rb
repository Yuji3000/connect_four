require './lib/board'
require 'pry'

RSpec.describe Board do
  describe '#initialize_board' do
    xit 'board exists' do
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end

  xit 'can build cells' do 
      board = Board.new
      # board.build_board
      expect(board.cells.values[0]).to eq(".") 
      expect(board.cells.values[41]).to eq(".") 
      expect(board.cells.values[42]).to eq(nil) 
      # expect(board.build_board.values[0]).to eq(["a1", "b1", "c1", "d1", "e1", "f1", "g1"])
      # expect(board.build_board.keys[1]).to eq(["a2", "b2", "c2", "d2", "e2", "f2", "g2"])
      # expect(board.build_board.keys[2]).to eq(["a3", "b3", "c3", "d3", "e3", "f3", "g3"])
    end
    
    xit 'can render a new board' do 
      board = Board.new
      # player = Player.new
      expect(board.render_board).to eq(".")
      # expect(board.render_board.values[1]).to eq[[".", ".", ".", ".", ".", ".", "."]]
      # expect(board.render_board.values[2]).to eq[[".", ".", ".", ".", ".", ".", "."]]
      #   board.move("a")
      # expect(board.render_board.values[5]).to eq[["X", ".", ".", ".", ".", ".", "."]]
      #   board.move("d")
      # expect(board.render_board.values[5]).to eq[["X", ".", ".", "X", ".", ".", "."]]
    end

  # ## better in game class?
  #   xit 'can change key values based on player input' do 
  #     board = Board.new
  #     # expect(board.render_board).to eq()
  #     expect(board.move("a")).to be_a Hash
  #     expect(board.move("a").count).to eq 42
  #     expect(board.move("a")).to include("a1" => ".")
  #     expect(board.move("a")).to include("a2" => ".")
  #     expect(board.move("a")).to include("a3" => "X")
  #   end
    
    # describe '#pick_column' do
    #   it 'finds the column chosen by player' do
    #     board = Board.new
    #     board.render_board
    #     expect(board.render_board).to eq(".")

    #   end
    # end
end