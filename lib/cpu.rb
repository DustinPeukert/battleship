class CPU
  attr_reader :board, :tracked_coords
  def initialize(board)
    @board = board
    @tracked_coords = []
  end
end