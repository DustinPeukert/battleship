class CPU
  attr_reader :board

  def initialize(board)
    @board = board
    @fire_options = @board.cells.keys
  end

  def place_ship(ship)
    return false if !ship.is_a?(Ship)
    all_coords = @board.cells.keys
    directions = ["Up", "Down", "Left", "Right"]
    coordinates = []

    starting_coord = all_coords.delete(all_coords.sample)
    unless @board.cells[starting_coord].ship == nil
      starting_coord = all_coords.delete(all_coords.sample)
    end
    
    until @board.valid_placement?(ship, coordinates)
      if directions.size == 0
        directions = ["Up", "Down", "Left", "Right"]
        coordinates.clear
        starting_coord = all_coords.delete(all_coords.sample)
        unless @board.cells[starting_coord].ship == nil
          starting_coord = all_coords.delete(all_coords.sample)
        end
      end
      
      coordinates << starting_coord
      
      direction = directions.delete(directions.sample)
      
      current_coord = starting_coord
      
      (ship.length - 1).times do
        if direction == "Up"
          new_coord = (current_coord[0].ord - 1).chr + current_coord[1]
        elsif direction == "Down"
          new_coord = (current_coord[0].ord + 1).chr + current_coord[1]
        elsif direction == "Left"
          new_coord = current_coord[0] + (current_coord[1].to_i - 1).to_s
        elsif direction == "Right"
          new_coord = current_coord[0] + (current_coord[1].to_i + 1).to_s
        end
        coordinates << new_coord

        current_coord = new_coord
      end
      
    end
    @board.place(ship, coordinates)
  end

  def fire_at(opponent_board)
    coordinate = @fire_options.delete(@fire_options.sample)
    opponent_board.cells[coordinate].fire_upon
  end
end

