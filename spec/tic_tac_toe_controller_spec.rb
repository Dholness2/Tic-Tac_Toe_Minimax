 require 'spec_helper'

 describe TicTacToeController do
  let(:user_marker) {"x"}
  let(:test_board) { Board.new(:board_size=> 3,:empty_position_placeholder=>"_") }
  let(:test_computer) {Computer.new(:max_player => "o",:mini_player => "x")}
  let(:test_view) { TerminalView.new}
  let(:test_controller) { TicTacToeController.new(:board_size=> 3,:empty_position_placeholder=>"_",:view =>test_view,:board => test_board)}




  it "should  take the users next move and update the board " do



  end

 #  it "should return invalid move when the user selects a non valid or unavialble position" do
 #      expect(board_update(user_marker,0)).to eq(test_board.board[0] == user_marker)
 #  end

 # it " should update the board with the computers nect move" do

 # end


 # it "should retutn invalid move if the computers move is invalid"do

 # end


 # it "sould ask the user if they  want to play again " do

 # end


 # it "should ask the user if they want to be X or O " do
 #      expect(get_marker).to eq(user_marker == "x")
 # end

#  it "should keep count of the depth(number of moves) of the game"

#  it "should determine if a row contains one unique string "

#  it "should determine if a columns contains a unique string"

#  it "should announce winners based on game rules"

#  it " should restart the game"

 end
