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
    return 5 - depth   if board.available_moves
    draw = 0
  end

  def minimax (board,depth, maximizing_player)
    return score(depth,board) if board.winner ||  depth == 4
    scores = []
    moves = []
    if maximizing_player
      board.available_moves.each do |possible_move|
        board.move(@maximizing_player,possible_move)
        scores.push minimax(board,depth+1,false)
        moves.push possible_move
        board.undo_move(possible_move)
      end

      max_score_index = scores.each_with_index.max[1]
      @move = moves[max_score_index]
      return scores[max_score_index]
    else
      board.available_moves.each do |possible_move|
        board.move(@minimizing_player,possible_move)
        scores.push minimax(board,depth+1,true)
        moves.push possible_move
        board.undo_move(possible_move)
      end
      min_score_index = scores.each_with_index.min[1]
      @move = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end


