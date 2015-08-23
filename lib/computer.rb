class Computer
  attr_accessor :move
  def initialize (args ={})
    @maximizing_marker = args[:max_marker]
    @minimizing_marker = args[:mini_marker]
    @move
  end


def score (depth,board)
    return 10 - depth  if board.winner == @maximizing_marker
    return depth - 10  if board.winner == @minimizing_marker
    draw = 0
  end

  def best_move (scores,moves,maximizing)
    if maximizing
      max_score_index = scores.each_with_index.max[1]
      @move = moves[max_score_index]
      return scores[max_score_index]
    else
      min_score_index = scores.each_with_index.min[1]
      @move = moves[min_score_index]
      return scores[min_score_index]
    end
  end

  def minimax (board,depth, maximizing)
    return score(depth,board) if board.winner ||  depth == 8
    scores = []
    moves = []
    board.available_moves.each do |possible_move|
      board.move(@maximizing_marker,possible_move) if maximizing
      board.move(@minimizing_marker,possible_move) if !maximizing
      scores.push minimax(board,depth+1,false) if maximizing
      scores.push minimax(board,depth+1,true) if !maximizing
      moves.push possible_move
      board.undo_move(possible_move)
    end
    best_move(scores,moves,maximizing)
  end
end
