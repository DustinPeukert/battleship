require_relative 'spec_helper'

RSpec.describe Ship do
  describe '#initialization' do
    it 'exists' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser).to be_an_instance_of(Ship)
    end

    it 'has attributes' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
      expect(cruiser.health).to eq(3)
    end

    it 'can have different attributes' do
      destroyer = Ship.new("Destroyer", 2)

      expect(destroyer.name).to eq("Destroyer")
      expect(destroyer.length).to eq(2)
      expect(destroyer.health).to eq(2)
    end
  end

  describe '#sunk?' do
    it 'can check if sunk' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.sunk?).to be false
    end

    it 'is sunk when it has no health' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.sunk?).to be false
      cruiser.hit
      cruiser.hit
      cruiser.hit
      expect(cruiser.health).to eq(0)
      expect(cruiser.sunk?).to be true
    end
  end

  describe '#hit' do
    it 'will decrease health by one' do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser.health).to eq(3)
      cruiser.hit
      expect(cruiser.health).to eq(2)
      cruiser.hit
      expect(cruiser.health).to eq(1)
    end
  end
end
