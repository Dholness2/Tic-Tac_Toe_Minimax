require_relative 'board'
require_relative 'ai_minimax'
class TicTacController
# computer_player = ai.new(:board_size = 3 ,"y","x")
tic_tac_toe = Board.new(:board_size => 3)
 whatson = Computer.new("y","x")



def run
  tic_tac_toe = Board.new(:board_size => 3)
  computer_marker ="y"
  user_marker ="x"
  whatson = Computer.new(computer_marker,user_marker)
  until tic_tac_toe.winner
    puts tic_tac_toe
    puts "Select you first move : \n"
    user_move = gets.to_i
  until tic_tac_toe.move(user_marker,user_move)
    print "invalid move, Select again?"
    user_move = gets.to_i
  end
    puts tic_tac_toe
    break if tic_tac_toe.winner
    print "#{tic_tac_toe.move_count}"
    puts"Select your move player two \n"
    whatson.minimax(tic_tac_toe,tic_tac_toe.move_count,true)
    until tic_tac_toe.move(computer_marker,whatson.choice) || tic_tac_toe.winner
      p
      print "invalid move, Select again?"
      ai_move = whatson.choice
    end
    print tic_tac_toe
  end
  print tic_tac_toe.winner +"/n"
  print "Would you like to play again?"
end

end

 TicTacController.new.run

print "Would you like to play again?"
