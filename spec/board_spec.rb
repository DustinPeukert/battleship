require_relative 'spec_helper'

RSpec.describe Board do
  describe "#initialize" do
    it "exists" do 
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end

  describe "#cells" do
    it "is a hash" do
      board = Board.new
      board.cells
      expect(board.cells).to be_a(Hash)
    end

    it "should have 16 key/value pairs" do
      board = Board.new
      board.cells
      expect(board.cells.size).to eq(16)
    end

    it "has keys that point to cell objects" do
      board = Board.new
      board.cells
      board.cells.each do |coordinate, cell|
        expect(cell).to be_a(Cell)
      end
    end
  end

  describe "#valid_coordinate?" do
    it "returns true if coordinate exists" do
      board = Board.new
      expect(board.valid_coordinate?("A1")).to be true
    end

    it "returns false if coordinate does not exist" do
      board = Board.new
      expect(board.valid_coordinate?("A5")).to be false
    end
  end

    
  describe "#valid_placement?" do
    it "returns false if the number of coordinates does not match the ship's length" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it "returns false if the coordinates are not consecutive" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it "returns false if the coordinates are diagonal" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it "returns true if the coordinates are valid and consecutive" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    end
  end
end