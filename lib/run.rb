$: <<"."
require 'board'
require 'computer'
require 'terminal_view'
require 'tic_tac_toe_controller'
require 'player'

human_player = Player.new(:marker=>"x")
whatson = Computer.new(:max_marker =>"o",:mini_marker => human_player.marker)
tic_tac_toe = Board.new(:board_size => 3, :empty_position_placeholder=>"_")
view = TerminalView.new()
game = TicTacToeController.new(:board=> tic_tac_toe,:computer => whatson,:view=>view,:player=>human_player)
game.run
