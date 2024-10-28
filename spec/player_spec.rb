require_relative 'spec_helper'

RSpec.describe Player do
  describe '#initialize' do
    it 'exists' do
      player = Player.new(player_board)
      expect(player).to be_an_instance_of(Player)
    end

    it 'has board' do 
      player_board = Board.new
      player = Player.new(player_board)
      expect(player.board).to be_an_instance_of(Board)
      expect(player.board).to eq(player_board)
    end
  end
  context 'it can use the #place_ship which is already tested' do 
    it 'can place ship' do
      player_board = Board.new
      player = Player.new(player_board)
      cruiser = Ship.new("Cruiser", 3)  
      expect(player_board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
      expect(player.place(cruiser, ["A1", "A2", "A3"])).to be true
    end
  end
end