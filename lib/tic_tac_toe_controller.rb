require_relative 'board'
# computer_player = ai.new(:board_size = 3 ,"y","x")
tic_tac_toe = Board.new(:board_size => 3)

until tic_tac_toe.winner
  puts tic_tac_toe
  puts "Select you first move : \n"
  user_move = gets.to_i
  until tic_tac_toe.move("x",user_move)
    print "invalid move, Select again?"
    user_move = gets.to_i
  end
  puts tic_tac_toe
  break if tic_tac_toe.winner
  puts"Select your move player two \n"
  ai_move = gets.to_i
  until tic_tac_toe.move("y",ai_move) || tic_tac_toe.winner
    p
    print "invalid move, Select again?"
    ai_move = gets.to_i
  end
  print tic_tac_toe
end
print tic_tac_toe.winner

Print "Would you like to play again?"
