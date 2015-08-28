require 'spec_helper'
describe TicTacToeController do
  let(:test_player) {HumanPlayer.new(:marker=> "x")}
  let(:test_board) { Board.new(:board_size=> 3,:empty_position_placeholder=>"_") }
  let(:test_computer) {Computer.new(:max_marker => "o",:mini_marker => "x")}
  let(:test_view) { TerminalView.new()}
  let(:test_controller) { TicTacToeController.new(:board_size=> 3,:empty_position_placeholder=>"_",:view =>test_view,:board => test_board,:computer=> test_computer,:player=> test_player)}

  it "should update the board based on paramaters" do
    test_controller.update_board(test_player.marker,0)
    expect(test_board.board[0][0]).to eq(test_player.marker)
  end

  it "should get the player name and update players object name" do
    test_view.input = StringIO.new("donovan")
    test_view.output = StringIO.new()
    test_controller.get_player_name
    expect(test_player.name).to eq("donovan")
  end

  it "should  take the player next move and update the board " do
    test_view.input = StringIO.new("1")
    test_view.output = StringIO.new()
    test_controller.get_player_move
    expect(test_board.board[0][0]).to eq(test_player.marker)
  end

  it "should take the computer next move and update the board" do
    test_board.move(test_player.marker,0)
    test_controller.get_computer_move
    expect(test_board.board[1][1]).to eq(test_computer.maximizing_marker)
  end

  it "should return true incase of a win"do
    [0,3,6].each{|move| test_board.move(test_player.marker,move)}
    expect(test_controller.win).to  be_truthy
  end
end
