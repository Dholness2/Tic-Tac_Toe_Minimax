class Computer

  def initialize (maximizing_player,minimizing_player )
    @maximizing_player = maximizing_player
    @minimizing_player = minimizing_player
  end

  def possible_board_states(board,maximizing_player)


  end

  def score (player)
    return 10  if win(max_player)
    return -10 if win(min_player)
    no_win = o
  end


  def minimax (board,depth, maximizing_player)
    return move if board.winner
    depth+=1

    if maximizing_player
      best_move = []
      for possible_board_states.each do | board|
          value = minimax(board,depth -1,false)
          best_value = best_move.max
        end
        else
          best_move= []
          for possible_board_states.each |board|
            val = minimax(board,depth-1,TRUE)
            best_move=[] = min (bestValue,val)
          end
        end
      end
    end
