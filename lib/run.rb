$: <<"."
require 'board'
require 'computer'
require 'terminal_view'
require 'tic_tac_toe_controller'

computer_marker ="o"
user_marker ="x"
whatson = Computer.new(:max_player => computer_marker,:mini_player => user_marker)
tic_tac_toe = Board.new(:board_size => 3, :empty_position_placeholder=>"_")
view = TerminalView.new
game = TicTacToeController.new(:board=> tic_tac_toe,:computer => whatson,:view=>view)
game.run
