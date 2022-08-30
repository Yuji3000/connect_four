require './lib/board'
require 'pry'

RSpec.describe Board do
  describe '#initialize' do
    it 'board exists' do
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end
end