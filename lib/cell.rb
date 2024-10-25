class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if @ship.nil?
      true
    else
      false
    end
  end

  def place_ship(ship)
    if ship.is_a?(Ship) && @ship.nil?
      @ship = ship
    else
      nil
    end
  end
end