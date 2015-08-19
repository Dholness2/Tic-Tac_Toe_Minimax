require 'spec_helper'
describe TicTacToeController do
  let(:user_marker) {"x"}
  let(:computer_marker){"o"}
  let(:test_board) { Board.new(:board_size=> 3,:empty_position_placeholder=>"_") }
  let(:test_computer) {Computer.new(:max_player => "o",:mini_player => "x")}
  let(:test_view) { TerminalView.new()}
  let(:test_controller) { TicTacToeController.new(:board_size=> 3,:empty_position_placeholder=>"_",:view =>test_view,:board => test_board,:computer=> test_computer)}

  it "should update the board based on paramaters" do
    test_controller.update_board(user_marker,0)
    expect(test_board.board[0][0]).to eq(user_marker)
  end

  it "should  take the users next move and update the board " do
    test_view.input = StringIO.new("1")
    test_controller.get_user_move
    expect(test_board.board[0][0]).to eq(user_marker)
  end

  it "should take the computer next move and update the board"do
    test_board.move(user_marker,0)
    test_controller.get_computer_move
    expect(test_board.board[2][2]).to eq(computer_marker)
  end

  it "should return true incase of a win"do
    [0,3,6].each{|move| test_board.move(user_marker,move)}
    expect(test_controller.win).to  be_truthy
  end

end
