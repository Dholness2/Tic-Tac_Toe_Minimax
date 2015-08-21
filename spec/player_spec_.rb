require 'spec_helper'
describe Player do
  let(test_player){Player.new}
  it " returns a new player object" do
    expect(test_computer).to be_a Computer
  end

  it " sets the player's marker" do
    expect(test_player.set_marker("x")).to eq("x")
  end


  it "gets the player's marker" do
    test_player.set_marker("x'")
    expect(test_player.get_marker).to eq("x")
  end

  it "sets the players current move" do
    expect(test_player.update_move(3)).to eq("3")
  end

  it "gets the players current move" do
    test_player.get_current_move("1")
    expect(test_player.current_move).to eq("1")
  end

end
