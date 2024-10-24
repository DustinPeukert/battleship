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
end