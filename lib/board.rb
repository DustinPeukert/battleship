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
    if !coordinates.empty?
      coordinates.sort_by! do |coordinate|
        letter = coordinate[0]
        number = coordinate[1].to_i
        [letter, number]
      end

      if (ship.length == coordinates.length) &&
         (coordinates.all? { |coordinate| valid_coordinate?(coordinate) })
          consecutive_coordinates?(coordinates)
      else
        false
      end
    end
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
end