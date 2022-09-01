require './lib/board'
require 'pry'

RSpec.describe Board do
  describe '#initialize_board' do
    it 'board exists' do
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end

  # it 'test the grid' do
  #   board = Board.new
  #   expect(board.grid).to be_a_kind_of Hash
  # end
end