require_relative 'board'
require_relative 'computer'
require_relative 'Terminal_view'
require_relative 'tic_tac_toe_controller'


computer_marker ="o"
user_marker ="x"
whatson = Computer.new(:max_player => computer_marker,:mini_player => user_marker)
tic_tac_toe = Board.new(:board_size => 3)
view = TerminalView.new
game = TicTacController.new(:board=> tic_tac_toe,:computer => whatson,:view=>view)
game.run
