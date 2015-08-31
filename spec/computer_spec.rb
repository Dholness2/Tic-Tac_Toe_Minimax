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

  it "scores the game state(draw)  at depth 9" do
    [0,1,5,6,8].each{|move| test_board.move("x",move)}
    [2,3,4,7].each{|move| test_board.move("o",move)}
    expect(test_computer.score(9,test_board)).to eq(0)
  end

  it "scores the game state a max win at depth 8 " do
    [0,4,8,5].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3,6,2,7].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(8,test_board)).to eq(2)
  end

  it "scores the game state a  max win  at depth 7 " do
    [0,4,8,].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3,6,2,7].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(7,test_board)).to eq(3)
  end

  it "scores the game state a max win  at depth 6 " do
    [0,4,8].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3,6,2].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(6,test_board)).to eq(4)
  end

  it "scores the game state a max win at depth 5 " do
    [0,4,8].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3,6,].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(5,test_board)).to eq(5)
  end

  it "scores the game state a draw at depth 4 " do
    [0,4].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3,6,].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(4,test_board)).to eq(0)
  end

  it "scores the game state a  min win in consideration at depth 8 " do
    [0,4,8,5].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    [3,6,2,7].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    expect(test_computer.score(8,test_board)).to eq(-2)
  end

  it "scores the game state a  min win in consideration at depth 7 " do
    [0,4,8,].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    [3,6,2,7].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    expect(test_computer.score(7,test_board)).to eq(-3)
  end

  it "scores the game state a min win in consideration at depth 6 " do
    [0,4,8].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    [3,6,2].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    expect(test_computer.score(6,test_board)).to eq(-4)
  end

  it "scores the game state a min win in consideration at depth 5 " do
    [0,4,8].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    [3,6,].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    expect(test_computer.score(5,test_board)).to eq(-5)
  end


  it "scores the game state a draw in consideration at depth 3 " do
    [0,4].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(3,test_board)).to eq(0)
  end

  it "scores the game state a draw in consideration at depth 3 " do
    [0,4].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(3,test_board)).to eq(0)
  end

  it "scores the game state a draw in consideration at depth 2 " do
    [0].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(2,test_board)).to eq(0)
  end

  it "scores the game state a draw in consideration at depth 1 " do
    [0].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.score(1,test_board)).to eq(0)
  end

  it " should select the highest scoring move for maximizing " do
    scores = [6,5,4]
    moves  = [1,2,3]
    expect(test_computer.best_move(scores,moves,true)).to eq(6)
    expect(test_computer.current_move).to eq(1)
  end

  it " should select the lowest scoring move for minimizing " do
    scores = [6,5,4]
    moves  = [1,2,3]
    expect(test_computer.best_move(scores,moves,false)).to eq(4)
    expect(test_computer.current_move).to eq(3)
  end

  it" calculates highest move and score for maxmizing player Depth:3" do
    [0,4].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    [3].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    expect(test_computer.minimax(test_board,3,true)).to eq(6)
    expect(test_computer.current_move).to eq(8)
  end

  it" calculates highest move and score for miniizing player Depth:3" do
    [0,4].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    [3,].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    expect(test_computer.minimax(test_board,3,false)).to eq(-6)
    expect(test_computer.current_move).to eq(8)
  end

  it " blocks min player" do
    [0,3].each{|move| test_board.move(test_computer.minimizing_marker,move)}
    [1].each{|move| test_board.move(test_computer.maximizing_marker,move)}
    expect(test_computer.minimax(test_board,3,true)).to eq(-3)
    expect(test_computer.current_move).to eq(6)
  end

  it " sets the computers's name" do
    expect(test_computer.set_name("donovan")).to eq("donovan")
    expect(test_computer.name).to eq("donovan")
  end

it " get the computers next move" do
  [0,3].each{|move| test_board.move(test_computer.minimizing_marker,move)}
  [4].each{|move| test_board.move(test_computer.maximizing_marker,move)}
  test_computer.get_move(test_board)
  expect(test_board.board[2][0]).to eq(test_computer.maximizing_marker)
  end
end
