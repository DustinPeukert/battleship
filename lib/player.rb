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
end