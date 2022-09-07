require './lib/board'
require './lib/player'
require 'pry'

RSpec.describe Board do

  it "had a player" do
    player = Player.new('kristen')
    expect(player).to be_an_instance_of(Player)
  end

  it 'can make move' do 
    board = Board.new
    player = Player.new('kristen')
    expect(player.player_move("a")).to be_a Hash
    expect(player.player_move("a").count).to eq 42
    expect(player.player_move("a")).to include("a1" => ".")
    expect(player.player_move("a")).to include("a2" => ".")
    # expect(board.move("a")).to include("a3" => "X")
    end
end