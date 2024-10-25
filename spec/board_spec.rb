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
end