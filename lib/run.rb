require_relative 'board_two'
require_relative 'benchmarks/computer_benchmarks'
require_relative 'terminal_view'
require_relative 'tic_tac_toe_controller'


computer_marker ="o"
user_marker ="x"
whatson = Computer.new(:max_player => computer_marker,:mini_player => user_marker)
tic_tac_toe = BoardTwo.new(:board_size => 9, :empty_position_placeholder=>"_")
view = TerminalView.new
game = TicTacController.new(:board=> tic_tac_toe,:computer => whatson,:view=>view)
game.run
