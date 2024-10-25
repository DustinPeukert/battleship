class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
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

  def fire_upon
    if !@fired_upon
      if !@ship.nil?
        @ship.hit
      end

      @fired_upon = true
    else
      nil
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render(debug = false)
    debug = debug
    if !fired_upon? && !@ship.nil? && debug
      "S"
    elsif !fired_upon?
      "."
    elsif fired_upon? && @ship.nil?
      "M"
    elsif fired_upon? && !@ship.nil? && @ship.sunk?
      "X"
    elsif fired_upon? && !@ship.nil?
      "H"
    end
  end
end