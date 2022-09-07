require './lib/board'
require './lib/player'

RSpec.describe Player do

    it 'exists' do
      player1 = Player.new("Kristen")
      player2 = Player.new("Yuji")
      expect(player1).to be_an_instance_of(Player)
    end

    it 'player can make a move' do 
      board = Board.new
      player1 = Player.new("Kristen")
      expect(player1.player_move("a")).to be_a Hash
      expect(player1.player_move("a").count).to eq 42
      expect(player1.player_move("a")).to include("a1" => ".")
      expect(player1.player_move("a")).to include("a2" => ".")
    end
end