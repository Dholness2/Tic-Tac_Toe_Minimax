require 'spec_helper'
describe TicTacToeController do
  let(:test_view) { TerminalView.new()}
  let(:test_player) {HumanPlayer.new(:marker=> "x",:view=>test_view)}
  let(:test_board) { Board.new(:board_size=> 3,:empty_position_placeholder=>"_") }
  let(:test_computer) {Computer.new(:max_marker => "o",:mini_marker => "x",:name=>"whatson")}
  let(:test_controller) { TicTacToeController.new(:board_size=> 3,:empty_position_placeholder=>"_",:view =>test_view,:board => test_board,:player_two=> test_computer,:player_one=> test_player)}


  it "should ask the players name if they player oject does not have a name" do
    test_view.input = StringIO.new("donovan")
    test_view.output = StringIO.new()
    test_controller.get_player_name(test_controller.player_one,"1")
    expect(test_controller.player_one.name).to eq("donovan")
  end

  it "should get the players name and update players object name" do
    test_view.input = StringIO.new("donovan")
    test_view.output = StringIO.new()
    test_controller.game_init
    expect(test_player.name).to eq("donovan")
  end

  it "should display the game state" do
    test_view.output = StringIO.new()
    test_controller.get_home_view
    expect(test_view.output.string).to eq(
      "\e[H\e[2J\n"+
      "DON's TIC TAC TOE\n"+
      "Move key:\n"+
      "1|2|3\n"+
      "4|5|6\n"+
      "7|8|9\n"+
      " \n_|_|_\n"+
      "_|_|_\n"+
    "_|_|_\n")
  end

  it "should return true incase of a win" do
    [0,3,6].each{|move| test_board.move(test_player.marker,move)}
    expect(test_controller.win).to  be_truthy
  end

  it " should run a game of tic tac toe" do
    test_view.output =StringIO.new()
    test_view.input =StringIO.new("donovan\n1\n2\n9\n")
    test_controller.run
    expect(test_view.output.string).to eq(
      "\e[H\e[2J\nDON's TIC TAC TOE\n"+
      "Move key:\n1|2|3\n4|5|6\n7|8|9\n \n_|_|_\n_|_|_\n_|_|_\n"+
      "what is your name player1?"+
      "\n\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \n_|_|_\n_|_|_\n_|_|_\n"+
      "select your next move donovan"+
      "\n\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|_|_\n_|_|_\n_|_|_"+
      "\n\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|_|_\n_|o|_\n_|_|_"+
      "\n\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|_|_\n_|o|_\n_|_|_\n"+
      "select your next move donovan"+
      "\n\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|x|_\n_|o|_\n_|_|_\n"+
      "\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|x|o\n_|o|_\n_|_|_\n"+
      "\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|x|o\n_|o|_\n_|_|_\n"+
      "select your next move donovan"+
      "\n\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|x|o\n_|o|_\n_|_|x\n"+
      "\e[H\e[2J\n"+
      "DON's TIC TAC TOE\nMove key:\n1|2|3\n4|5|6\n7|8|9\n"+
      " \nx|x|o\n_|o|_\no|_|x\n"+
    "Result : o \n")
  end
end
