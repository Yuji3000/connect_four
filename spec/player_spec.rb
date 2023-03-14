require './lib/board'
require './lib/player'

RSpec.describe Player do
    it 'exists' do
      player1 = Player.new("Kristen")
      expect(player1).to be_an_instance_of(Player)
    end
endb