class Player
  attr_reader :board  

  def initialize(board)
    @board = board
  end

  def place(ship, coordinates)
   @board.place(ship, coordinates)
  end
end