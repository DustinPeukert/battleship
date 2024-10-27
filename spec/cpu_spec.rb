require_relative 'spec_helper'

RSpec.describe CPU do
  describe '#initialize' do
    it 'exists' do
      cpu_board = Board.new
      cpu = CPU.new(cpu_boardboard)

      expect(cpu).to be_an_instance_of(CPU)
    end

    it 'has attributes' do
      cpu_board = Board.new
      cpu = CPU.new(cpu_boardboard)

      expect(cpu.board).to eq(cpu_board)
      expect(cpu.board).to be an be_an_instance_of(Board)

      expect(cpu.tracked_coords).to eq([])
    end
  end

  describe '#place_ship' do
    context '#place_ship incorporates the boards #valid_placement? method' do
      it 'can choose valid placement for a ship' do
        cpu_board = Board.new
        cpu = CPU.new(cpu_board)
        cruiser = Ship.new("Cruiser", 3)

        expect(cpu.place_ship(cruiser)).to be true

        ship_placed = cpu_board.cells.values.select { |cell| cell.ship == cruiser }
    
        expect(ship_placed.size).to eq(cruiser.length)
      end

      it 'can do this for multiple ships' do
        cpu_board = Board.new
        cpu = CPU.new(cpu_board)
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(cpu.place_ship(cruiser)).to be true
        expect(cpu.place_ship(submarine)).to be true

        placed_cruiser = cpu_board.cells.values.select { |cell| cell.ship == cruiser }
        placed_submarine = cpu_board.cells.values.select { |cell| cell.ship == submarine }
    
        expect(placed_cruiser.size).to eq(cruiser.length)
        expect(placed_submarine.size).to eq(submarine.length)
      end
    end
  end

  describe '#choose_coordinate' do ####
    it 'chooses a random coordinate from existing board coordinates' do
      cpu_board = Board.new
      cpu = CPU.new(cpu_board)

      coordinate = cpu.choose_coordinate
      expect(cpu_board.cells.key?(coordinate)).to be true
    end

    it 'tracks already chosen coordinates and won\'t choose them again' do
      cpu_board = Board.new
      cpu = CPU.new(cpu_board)

      expect(cpu.tracked_coords).to eq([])

      16.times do
        tracked_coords << cpu.choose_coordinate
      end

      expect(tracked_coords.uniq.size).to eq(16)
    end
  end
end