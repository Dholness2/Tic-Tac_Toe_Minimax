require'../board'
require'../Board_two'
require'../computer'
require 'benchmark/ips'

class ComputerSlow
  attr_accessor :move
  def initialize (args)
    @maximizing_player = args[:max_player]
    @minimizing_player = args[:mini_player]
    @move
  end

  def avaliable_moves(board)
    moves= []
    board.board.flatten.each_with_index{|x,i| moves.push i if x =="_"}
    moves
  end

  def score (depth,board)
    return 10 - depth  if board.winner == @maximizing_player
    return depth - 10  if board.winner == @minimizing_player
    draw = 0
  end

def minimax (board,depth, maximizing_player)
    return score(depth,board) if board.winner
    scores = {}

    if maximizing_player
      board.available_moves.each do |possible_move|
        board.move(@maximizing_player,possible_move)
        scores["#{possible_move}"] = minimax(board,depth+1,false)
        board.undo_move(possible_move)
      end

      max_move = scores.max_by {|k,v| v}
      @move = max_move[0].to_i
    return max_move[1]
    else
      board.available_moves.each do |possible_move|
        board.move(@minimizing_player,possible_move)
        scores["#{possible_move}"] = minimax(board,depth+1,true)
        board.undo_move(possible_move)
      end
      min_move = scores.min_by {|k,v| v}
      @move = min_move[0].to_i
      return min_move[1]
    end
  end
end

 test_board = Board.new(:board_size=> 3,:empty_position_placeholder=>"_")
 test_board_two = BoardTwo.new(:board_size=> 9,:dimension=>3,:empty_position_placeholder=>"_")

computer_marker ="o"
user_marker ="x"
whatson_fast = Computer.new(:max_player => computer_marker,:mini_player => user_marker)
whatson_slow = ComputerSlow.new(:max_player => computer_marker,:mini_player => user_marker)

 test_board.move(user_marker,0)

  Benchmark.ips do |x|
    x.report('computer_slow'){  whatson_slow.minimax(test_board,1,computer_marker)}
    x.report('computer_fast') { whatson_fast.minimax(test_board,1,computer_marker) }
    x.compare
  end


