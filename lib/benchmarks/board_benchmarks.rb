
require 'benchmark/ips'
require  '../board'



# old
 def avaliable_moves_slow(board)
    moves= []
    board.flatten.each_with_index{|x,i| moves.push i if x =="_"}
    moves
  end

def available_moves(board)
   board.flatten.map.with_index{|x,i|  i if x =="_"}.compact
end
  #new soluition
 # def available_moves_fast
 #    board.flat_map
 #  end


  test_board = Board.new(:board_size=> 3,:empty_position_placeholder=>"_")
    [0,3,6].each{|move| test_board.move("o",move)}
    board =  test_board.board

  Benchmark.ips do |x|
    x.report('available_moves_fast'){  available_moves(board)}
    x.report('avaliable_moves_slow') { avaliable_moves_slow(board) }
    x.compare
  end