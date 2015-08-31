class TicTacToeController
  attr_accessor :tic_tac_toe,:whatson,:view,:player_one,:player_two
  def initialize (args={})
    @tic_tac_toe = args[:board]
    @view = args[:view]
    @player_one = args[:player_one]
    @player_two = args[:player_two]
  end

  def get_player_name(player,position)
    if !player.name
      view.display "what is your name player#{position}?"
      player.set_name(view.get_ans)
    end
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

  def game_init
    get_home_view
    get_player_name(player_one,"1")
    get_player_name(player_two,"2")
  end

  def run
    game_init
    until win
      get_home_view
      player_one.get_move(tic_tac_toe)
      break if win
      get_home_view
      player_two.get_move(tic_tac_toe)
      get_home_view
      break if win
    end
    view.display "Result : #{tic_tac_toe.winner} "
  end
end
