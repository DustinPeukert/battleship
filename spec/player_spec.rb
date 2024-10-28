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
end