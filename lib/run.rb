$: <<"."
require 'board'
require 'computer'
require 'terminal_view'
require 'tic_tac_toe_controller'
require 'human_player'
view = TerminalView.new()
human_player = HumanPlayer.new(:marker=>"x",:view=> view)
watson = Computer.new(:max_marker =>"o",:mini_marker => human_player.marker,:name=>"watson")
tic_tac_toe = Board.new(:board_size => 3, :empty_position_placeholder=>"_")
game = TicTacToeController.new(:board=> tic_tac_toe,:player_two =>watson,:view=>view,:player_one=>human_player)
game.run
