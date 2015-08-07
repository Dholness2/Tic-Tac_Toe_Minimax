class Board
  attr_accessor :board
  attr_reader   :board_size
  def initialize (args)
    @board_size = args[:board_size]
    @board = Array.new((@board_size)){Array.new(@board_size ,"_")}
    @move_count = 0
  end

  def to_s
    board.map{|row| row.join("|")+"\n"}.join("")
  end

  def move (player,location)
    return nil if location < 0 || location > ((board_size*board_size)-1)
    cordinates = location.divmod(board_size)
    x  = cordinates[1]
    y =  cordinates[0]
    return nil if !(board[y][x] == "_")
    board[y][x] = player
    move_count += 1
  end

  def draw?
    ! (board.flatten.include?("_"))
  end

  def row_check (matrix)
    winner = nil
    matrix.each do |row|
      winner = row[0] if row.uniq.size == 1 && row[0] !="_"
    end
    winner
  end

  def col_check
    row_check(board.transpose)
  end

  def winner
    if  row_check(board)
      return row_check(board)
    elsif row_check(board.transpose)
      return row_check(board.transpose)
    elsif draw?
      return "draw"
    else
      return false
    end
  end
end
# test_board = Board.new(:board_size=> 3)

# test_board.move("x",0)
# test_board.move("y",1)
# test_board.move("x",2)
# test_board.move("y",3)
# test_board.move("x",4)
# test_board.move("y",5)
# test_board.move("y",6)
# test_board.move("x",7)
# test_board.move("_",8)

# puts test_board
# print test_board.winner
