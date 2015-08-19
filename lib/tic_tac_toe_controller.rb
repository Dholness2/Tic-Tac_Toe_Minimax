class TicTacToeController
  attr_reader :tic_tac_toe,:whatson,:view
  def initialize (args)
    @tic_tac_toe = args[:board]
    @whatson = args[:computer]
    @view = args[:view]
  end

  def update_board(marker,move)
    next_move = move
    tic_tac_toe.move(marker,next_move)
  end

  def get_user_move
    view.display "select your move:"
    user_move =  view.get_move
    until update_board("x",user_move)
      view.display "invalid move, Select again?"
      user_move =  view.get_move
    end
  end

  def get_computer_move
    whatson.minimax(tic_tac_toe,tic_tac_toe.move_count,true)
    tic_tac_toe.move("o",whatson.move)
    view.display "invalid move, computer error"
  end

  def get_home_view
    view.clear
    view.welcome
    view.key
    view.board tic_tac_toe.board
  end

  def win
    tic_tac_toe.winner
  end

  def run
    until win
      get_home_view
      get_user_move
      break if win
      get_home_view
      get_computer_move
      get_home_view
      break if win
    end
    view.display "Result : #{tic_tac_toe.winner} "+ "\n"
  end

end
