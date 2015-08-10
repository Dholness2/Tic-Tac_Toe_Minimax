class Board
  attr_accessor :board,:move_count
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
    @move_count+=1
  end

  def draw?
    ! (board.flatten.include?("_"))
  end

  def row_check (matrix)
    winner = nil
    matrix.each do |row|
      winner = row[0] if row.uniq.size == 1 && !(row.include?"_")
    end
    winner
  end

  def col_check
    row_check(board.transpose)
  end

  def diagnoal_check()
    winner = nil
    d_one= []
    d_two =[]
    board_size.times{|i| d_one.push board[i][i] }
    board_size.times{|i| d_two.push board.reverse[i][i] }
    winner = d_one[0] if d_one.uniq.size == 1 && d_one[0] !="_"
    winner = d_two[0] if d_two.uniq.size == 1 && d_two[0] !="_"
    winner
  end

  def winner
    if  row_check(board)
      return row_check(board)
    elsif row_check(board.transpose)
      return row_check(board.transpose)
    elsif diagnoal_check()
      return diagnoal_check()
    elsif draw?
      return "draw"
    else
      return false
    end
  end
end
# test_board = Board.new(:board_size=> 3)


# test_board.move("y",2)
# test_board.move("y",4)
# test_board.move("y",8)
# test_board.move("x",2)
# test_board.move("x",6)
# test_board.move("y",7)


# print test_board

# p b = test_board.current_state
# p test_board.board.object_id
#  b.move("y",1)
# print test_board
# print test_board.winner

