require 'spec_helper'

  describe Board do

    it "takes the size of the board and returns a new board object"do
      test_board = Board.new(:board_size=> 3)
      expect(test_board).to be_a Board
    end
    it "updates the board based on the paramaters added to move method"


    it " it calculates any wins within the rows"

    it " it calculates any wins within the columns"

    it " it calculates any draws"

    it " it returns winners"


    end