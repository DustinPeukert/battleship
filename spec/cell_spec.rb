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
      expect(cell.fired_upon).to be false
    end

    it "can have a different attribute" do
      cell = Cell.new("A2")
      expect(cell.coordinate).to eq("A2")
    end

    it "has default attributes" do
      cell = Cell.new("A2")
      expect(cell.ship).to be nil
      expect(cell.fired_upon).to be false
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

  describe "#place_ship" do
    it "sets a ship to the cell" do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("A2")
      expect(cell.ship).to be nil
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end

    it "will only accept Ship objects" do
      cell = Cell.new("A2")
      expect(cell.place_ship("Cruiser")).to be nil
      expect(cell.ship).to be nil
    end

    it "will only accept one ship" do
      cell = Cell.new("A2")
      cruiser = Ship.new("Cruiser", 3)
      destroyer = Ship.new("Destroyer", 2)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.place_ship(destroyer)).to be nil
      expect(cell.ship).to eq(cruiser)
    end
  end

  describe "#fire_upon" do
    it "lets the ship know its been hit" do
      cell = Cell.new("A2")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cruiser.health).to eq(3)
      cell.fire_upon
      expect(cruiser.health).to eq(2)
    end

    it "can only be fired upon once" do
      cell = Cell.new("A2")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cruiser.health).to eq(3)
      cell.fire_upon
      expect(cruiser.health).to eq(2)
      expect(cell.fire_upon).to be nil
      expect(cruiser.health).to eq(2)
    end
  end

  describe "#fired_upon?" do
    it "checks if cell has been hit" do 
      cell = Cell.new("A2")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to be false
      cell.fire_upon
      expect(cell.fired_upon?).to be true
    end
  end

  describe "#render" do 
    context "render without an argument" do
      it "returns . if the cell has not been fired upon" do
        cell = Cell.new("B4")
        expect(cell.fired_upon?).to be false
        expect(cell.render).to eq(".")
      end

      it "returns M if cell is fired upon and does not have a ship" do
        cell = Cell.new("B4")
        cell.fire_upon
        expect(cell.fired_upon?).to be true
        expect(cell.render).to eq("M")
      end

      it "returns H if cell has been fired upon and has a ship" do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        cell.fire_upon
        expect(cell.fired_upon?).to be true
        expect(cell.render).to eq("H")
      end

      it "returns X if cell has been fired upon and has sunk" do 
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        cruiser.hit
        cruiser.hit
        expect(cruiser.sunk?).to be false
        cell.fire_upon
        expect(cruiser.sunk?).to be true
        expect(cell.fired_upon?).to be true
        expect(cell.render).to eq("X")
      end
    end

    context "render with optional argument" do
      it "returns S if cell has not been fired upon and cell has ship" do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        expect(cell.fired_upon?).to be false
        expect(cell.render(true)).to eq("S")
      end

      it "returns . if the cell has not been fired upon and does not have a ship" do
        cell = Cell.new("B4")
        expect(cell.fired_upon?).to be false
        expect(cell.render(true)).to eq(".")
      end

      it "returns M if cell is fired upon and does not have a ship" do
        cell = Cell.new("B4")
        cell.fire_upon
        expect(cell.fired_upon?).to be true
        expect(cell.render(true)).to eq("M")
      end

      it "returns H if cell has been fired upon and has a ship" do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        cell.fire_upon
        expect(cell.fired_upon?).to be true
        expect(cell.render(true)).to eq("H")
      end

      it "returns X if cell has been fired upon and has sunk" do 
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        cruiser.hit
        cruiser.hit
        expect(cruiser.sunk?).to be false
        cell.fire_upon
        expect(cruiser.sunk?).to be true
        expect(cell.fired_upon?).to be true
        expect(cell.render(true)).to eq("X")
      end
    end
  end
end