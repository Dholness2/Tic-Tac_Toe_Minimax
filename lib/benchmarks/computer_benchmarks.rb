# require'../board'
# require'../BoardTwo'
# require 'benchmark/ips'

class Computer
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

  # def minimax (board,depth, maximizing_player)
  #   return score(depth,board) if board.winner
  #   scores = []
  #   moves = []
  #   if maximizing_player
  #     avaliable_moves(board).each do |possible_move|
  #       board.move(@maximizing_player,possible_move)
  #       scores.push minimax(board,depth+1,false)
  #       moves.push possible_move
  #       board.undo_move(possible_move)
  #     end

  #     max_score_index = scores.each_with_index.max[1]
  #     @move = moves[max_score_index]
  #     return scores[max_score_index]
  #   else
  #     avaliable_moves(board).each do |possible_move|
  #       board.move(@minimizing_player,possible_move)
  #       scores.push minimax(board,depth+1,true)
  #       moves.push possible_move
  #       board.undo_move(possible_move)
  #     end
  #     min_score_index = scores.each_with_index.min[1]
  #     @move = moves[min_score_index]
  #     return scores[min_score_index]
  #   end
  # end


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

#  test_board = Board.new(:board_size=> 3,:empty_position_placeholder=>"_")
#  test_board_two = BoardTwo.new(:board_size=> 3,:empty_position_placeholder=>"_")
#     [0].each{|move| test_board.move("o",move)}
# computer_marker ="o"
# user_marker ="x"
# whatson = Computer.new(:max_player => computer_marker,:mini_player => user_marker)

#   Benchmark.ips do |x|
#     x.report('available_moves_slow'){  whatson.minimax(test_board,1,"x")}
#     x.report('avaliable_moves_fast') { whatson.minimax_two(test_board_two,1,"x") }
#     x.compare
#   end

