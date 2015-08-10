class TicTacController
  attr_reader :tic_tac_toe,:whatson,:view
  def initialize (args)
    @tic_tac_toe = args[:board]
    @whatson = args[:computer]
    @view = args[:view]
  end
  def run

    until tic_tac_toe.winner
      view.clear
      view.welcome
      view.key
      view.display tic_tac_toe
      view.display"Select your move : \n"
      user_move =  view.get_move
      until tic_tac_toe.move("x",user_move)
        view.display "invalid move, Select again?"
        user_move = view.get_move
      end
      view.clear
      view.key
      view.display tic_tac_toe
      break if tic_tac_toe.winner
      whatson.minimax(tic_tac_toe,tic_tac_toe.move_count,true)
      until tic_tac_toe.move("o",whatson.move) || tic_tac_toe.winner
        view.display "invalid move, Select again?"
        ai_move = whatson.move
      end
      view.clear
      view.display tic_tac_toe
       view.display "Result : #{tic_tac_toe.winner} "+ "\n"
     end

  end
end
