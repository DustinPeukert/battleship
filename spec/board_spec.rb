require_relative 'spec_helper'

RSpec.describe Board do
  describe "#initialize" do
    it "exists" do 
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end
  end
end