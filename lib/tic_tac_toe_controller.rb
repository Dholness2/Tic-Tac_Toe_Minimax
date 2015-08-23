class TicTacToeController
  attr_accessor :tic_tac_toe,:whatson,:view,:player
  def initialize (args={})
    @tic_tac_toe = args[:board]
    @whatson = args[:computer]
    @view = args[:view]
    @player = args[:player]
  end

  def update_board(marker,move)
    next_move = move
    tic_tac_toe.move(marker,next_move)
  end

  def get_player_name
    view.display " what is your name?"
    player.set_name(view.get_ans)
  end

  def get_player_move
    view.display "select your next move #{player.name}"
    player.update_move(view.get_move)
    until update_board(player.marker,player.move)
      view.display "invalid move, Select again?"
      player.set_move(view.get_move)
    end
  end

  def get_computer_move
    whatson.minimax(tic_tac_toe,tic_tac_toe.move_count,true)
    tic_tac_toe.move("o",whatson.move)
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
    get_home_view
    get_player_name
    until win
      get_home_view
      get_player_move
      break if win
      get_home_view
      get_computer_move
      get_home_view
      break if win
    end
    view.display "Result : #{tic_tac_toe.winner} "
  end

end
