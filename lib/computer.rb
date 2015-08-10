require_relative 'board'
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
      @move = moves[max_score_index]
      return scores[max_score_index]
    else
      avaliable_moves(board).each do |current_move|
        possible_board_state = board.copy_state
        possible_board_state.move(@minimizing_player,current_move)
        scores.push minimax(possible_board_state,depth+1,true)
        moves.push current_move
      end
      min_score_index = scores.each_with_index.min[1]
      @move = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end

