require 'spec_helper'
describe ComputerPlayer do
  let(:test_computer) {ComputerPlayer.new{}}

 let(:test_board) { test_board = Board.new(:board_size=> 3,:empty_position_placeholder=>"_") }

it " creates a new  computerplayer object " do
    test_computer.to be_a ComputerPlayer
end

it "sets the computers marker" do
   test_computer.set_marker("x")
end


it "gets the computers next move" do
    test_computer.next_move(board).to eq(test_board.board[][] = test_computer.marker)
end


end