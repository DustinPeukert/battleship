require_relative 'spec_helper'

RSpec.describe Player do
  describe '#initialize' do
    it 'exists' do
      player_board = Board.new
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
      expect(player.place(cruiser, ["A1", "A2", "A3"])).to be true
    end

    it 'will return false if invalid coordinate' do
      player_board = Board.new
      player = Player.new(player_board)
      cruiser = Ship.new("Cruiser", 3)  
      expect(player.place(cruiser, ["A1", "A2", "A4"])).to be false
    end
  end

  describe '#fire_at' do
    it 'player can fire at oppenents board' do
      player_board = Board.new
      player = Player.new(player_board)
      opponent_board = Board.new
      coordinate = "A1"
      player.fire_at(opponent_board, coordinate)

      expect(opponent_board.cells["A1"].fired_upon?).to be true 
    end 
    
    it 'will return false if coordinate is invalid' do
      player_board = Board.new
      player = Player.new(player_board)
      opponent_board = Board.new
      invalid_coordinate = "E1"
    
      expect(player.fire_at(opponent_board, invalid_coordinate)).to be false
    end
  end

  describe '#has_lost?' do 
    context 'when all ships have been sunk' do
      it 'returns true if player has lost' do
        player_board = Board.new
        player = Player.new(player_board)
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        player.place(cruiser,["A1", "A2", "A3"])
        player.place(submarine, ["C1", "C2"])

        expect(player.has_lost?).to be false

        player_board.cells.each do |coordinate, cell|
          if cell.ship
            cell.fire_upon
          end
        end
        expect(player.has_lost?).to be true
      end
    end
  end
end