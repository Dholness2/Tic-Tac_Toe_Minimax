require_relative "board"
class Computer
  attr_accessor :choice
  def initialize (args)
    @maximizing_player = args[:max_player]
    @minimizing_player = args[:mini_player]
    @choice
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
    scores = []
    moves = []
    if maximizing_player
      avaliable_moves(board).each do |current_move|
        possible_board_state = board.copy_state
        possible_board_state.move(@maximizing_player,current_move)
        scores.push minimax(possible_board_state,depth+1,false)
        moves.push current_move
      end

      max_score_index = scores.each_with_index.max[1]
      @choice = moves[max_score_index]
      return scores[max_score_index]
    else
      avaliable_moves(board).each do |current_move|
        possible_board_state = board.copy_state
        possible_board_state.move(@minimizing_player,current_move)
        scores.push minimax(possible_board_state,depth+1,true)
        moves.push current_move
      end
      min_score_index = scores.each_with_index.min[1]
      @choice = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end

# test_board = Board.new(:board_size=> 3)

# test_board.move("x",0)
# test_board.move("y",3)
# test_board.move("x",1)


# print test_board
#  p test_board.winner

#  y ="y"
#  x = "x"
#  test_ai = Computer.new y, x
#  p test_ai.minimax(test_board,5,true)
#  p test_ai.choice
#  p test_board.winner
# #  p test_board.board.transpose
