class Player
  attr_reader :board  

  def initialize(board)
    @board = board
  end

  def place(ship, coordinates)
   @board.place(ship, coordinates)
  end

  def fire_at(opponent_board, coordinate)
    opponent_board.cells[coordinate].fire_upon
  end

  def has_lost?
    @board.cells.each do |coordinate, cell|
      return false if cell.ship && !cell.ship.sunk?
    end
    true
  end
end