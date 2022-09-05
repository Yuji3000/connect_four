require './lib/game'
require './lib/board'
require 'pry'
require 'rspec'

describe '#initialize' do
  it 'game exists' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  describe '#start' do
    it 'starts the game' do
      game = Game.new
      !!!

    end
  end

  
end


