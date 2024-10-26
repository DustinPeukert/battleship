require_relative 'cell'

class Board
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def cells
    @cells
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.empty?
    return false unless coordinates.all? { |coordinate| valid_coordinate?(coordinate) }
    return false if ship.length != coordinates.length
    return false if coordinates.any? { |coordinate| !@cells[coordinate].empty? }

    coordinates.sort_by! do |coordinate|
      letter = coordinate[0]
      number = coordinate[1].to_i
      [letter, number]
    end

    consecutive_coordinates?(coordinates)
  end

  def consecutive_coordinates?(coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    numbers = coordinates.map { |coordinate| coordinate[1].to_i }

    if !consecutive_letters?(letters) && consecutive_numbers?(numbers)
      true
    elsif consecutive_letters?(letters) && !consecutive_numbers?(numbers)
      true
    else 
      false
    end
  end

  def consecutive_numbers?(numbers)
    numbers.each_cons(2).all? { |first, second| second - first == 1 }
  end

  def consecutive_letters?(letters)
    letters.each_cons(2).all? { |first, second| second.ord - first.ord == 1 }
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship) 
      end
      true
    else
      false
    end
  end

  def render(debug = false)
    cell_render = []

    @cells.values.each do |cell|
      cell_render << cell.render(debug)
    end
    
    "  1 2 3 4 \n" +
    "A #{cell_render[0]} #{cell_render[1]} #{cell_render[2]} #{cell_render[3]} \n" +
    "B #{cell_render[4]} #{cell_render[5]} #{cell_render[6]} #{cell_render[7]} \n" +
    "C #{cell_render[8]} #{cell_render[9]} #{cell_render[10]} #{cell_render[11]} \n" +
    "D #{cell_render[12]} #{cell_render[13]} #{cell_render[14]} #{cell_render[15]} \n"
  end
end