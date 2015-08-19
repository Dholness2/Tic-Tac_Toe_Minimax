require 'spec_helper'

describe BoardTwo do
  let(:test_board) { test_board = BoardTwo.new(:board_size=> 9,:empty_position_placeholder=>"_", :dimension=>3) }
  it "takes the size of the board and returns a new board object"do
    expect(test_board).to be_a BoardTwo
  end
  it "updates the board based on the paramaters added to move method" do
    test_board.move("x",0)
    expect(test_board.board[0]).to eq ("x")
  end

  it "will replace a filled position with " do
        [0,3,6].each{|move| test_board.move("O",move)}
        [0,3,6].each{|move| test_board.undo_move(move)}
        expect(test_board.col_check).to eq(nil)

  end

  it " it will return all available moves"do
      [0,3,6].each{|move| test_board.move("o",move)}
      expect(test_board.available_moves).to eq([1,2,4,5,7,8])
   end

  it " it calculates any wins within the rows"do
    [0,1,2].each{|move| test_board.move("x",move)}
    expect(test_board.row_check(test_board.board)).to eq("x")
  end

  it " it calculates any wins within the columns" do
    [0,3,6].each{|move| test_board.move("o",move)}
    expect(test_board.col_check).to eq("o")
  end
  it " it calculates any draws" do
    [0,1,5,6,8].each{|move| test_board.move("x",move)}
    [2,3,4,7].each{|move| test_board.move("o",move)}
    expect(test_board.draw?).to be(true)
  end

  it " it returns winners"do
    [3,4,5].each{|move| test_board.move("x",move)}
    expect(test_board.row_check(test_board.board)).to eq("x")
  end
  it " check for diagnol wins(top_down)" do
    [0,4,8].each{|move| test_board.move("x",move)}
    expect(test_board.diagnoal_check).to eq("x")
  end
  it " check for diagnol wins(bottom_up)" do
    [2,4,6].each{|move| test_board.move("y",move)}
    expect(test_board.diagnoal_check).to eq("y")
  end

 it "updates the computers best move based on board state"do

end


end
