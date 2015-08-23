require 'spec_helper'
describe Computer do
  let(:test_board) { test_board = Board.new(:board_size=> 3,:empty_position_placeholder=>"_") }
  let (:test_computer) { test_computer= Computer.new(:max_marker => "o",:mini_marker => "x")}

  it "Computer.new returns a new terminal object" do
    expect(test_computer).to be_a Computer
  end

  it "scores the game state(win) for maxmizing player" do
    [3,4,5].each{|move| test_board.move("o",move)}
    expect(test_computer.score(0,test_board)).to eq(10)
  end

  it "scores the game state(win) for minimizing player" do
    [3,4,5].each{|move| test_board.move("x",move)}
    expect(test_computer.score(0,test_board)).to eq(-10)
  end

  it "scores the game state(draw) " do
    [0,1,5,6,8].each{|move| test_board.move("x",move)}
    [2,3,4,7].each{|move| test_board.move("o",move)}
    expect(test_computer.score(9,test_board)).to eq(0)
  end

  it" calculates highest move and score for maxmizing player" do
    [0,4].each{|move| test_board.move("x",move)}
    [3,].each{|move| test_board.move("o",move)}
    expect(test_computer.minimax(test_board,3,true)).to eq(-3)
    expect(test_computer.move).to eq(8)
  end

  it " blocks min player" do
    [0,3].each{|move| test_board.move("x",move)}
    [1].each{|move| test_board.move("o",move)}
    expect(test_computer.minimax(test_board,3,true)).to eq(-3)
    expect(test_computer.move).to eq(6)
  end
end
