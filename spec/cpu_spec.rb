require_relative 'spec_helper'

RSpec.describe CPU do
  describe '#initialize' do
    it 'exists' do
      cpu_board = Board.new
      cpu = CPU.new(cpu_boardboard)

      expect(cpu).to be_an_instance_of(CPU)
    end

    it 'has attributes' do
      cpu_board = Board.new
      cpu = CPU.new(cpu_boardboard)

      expect(cpu.board).to eq(cpu_board)
      expect(cpu.board).to be an be_an_instance_of(Board)

      expect(cpu.tracked_coords).to eq([])
    end
  end
end