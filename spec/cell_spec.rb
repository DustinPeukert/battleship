require_relative 'spec_helper'

RSpec.describe Cell do
  describe "#initialize" do
    it "exists" do
      cell = Cell.new("B4")
      expect(cell).to be_an_instance_of(Cell)
    end

    it "it has attributes" do
      cell = Cell.new("B4")
      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to be nil
    end

    it "can have a different attribute" do
      cell = Cell.new("A2")
      expect(cell.coordinate).to eq("A2")
    end

    it "has a default attribute" do
      cell = Cell.new("A2")
      expect(cell.ship).to be nil
    end
  end

  describe "#empty?" do
    it "returns true if there is no ship" do
      cell = Cell.new("A2")
      expect(cell.ship).to be nil
      expect(cell.empty?).to be true
    end

    it "returns false when a ship is present" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("A2")
      expect(cell.empty?).to be true
      cell.place_ship(cruiser)
      expect(cell.empty?).to be false
    end
  end
end