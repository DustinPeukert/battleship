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
      board.cells.each do |cell|
        expect(cell).to be_a(Cell)
      end
    end
  end
end