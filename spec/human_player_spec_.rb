require 'spec_helper'
describe Player do
  let(test_player){Player.new}
  let(:test_board) { Board.new(:board_size=> 3,:empty_position_placeholder=>"_") }
  it " returns a new player object" do
    expect(test_computer).to be_a Computer
  end

  it " sets the player's marker" do
    expect(test_player.set_marker("x")).to eq("x")
  end

  it " sets the player's name" do
    expect(test_player.set_name("donovan")).to eq("donovan")
  end

  it "gets the player's marker" do
    test_player.set_marker("x'")
    expect(test_player.get_marker).to eq("x")
  end

  it "sets the players current move" do
    expect(test_player.update_move(3)).to eq("3")
  end

  it "gets the players current move" do
    test_player.update_move("1")
    expect(test_player.move).to eq("1")
  end

  it "gets the players next move" do
    test_view.input = StringIO.new("1")
    test_view.output = StringIO.new()
    test_player.get_move(test_board)
    expect(test_board.board[0][0]).to eq(test_.player.marker)
  end

  it "validates the user has submited the correct move" do
    expect(test_player.validate_move(1,test_board)).to eq(true)
  end

  it "validates the use submited an incorrect move" do
    expect(test_player.validate_move(50,test_board)).to eq(nil)
    expect(test_player.validate_move)("g",test_board)).to eq(nil)
  end


end
