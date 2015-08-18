class Board
  attr_accessor :board,:move_count
  attr_reader   :board_size, :empty_position_placeholder,:board
  def initialize (args)
    @board_size = args[:board_size]
    @empty_position_placeholder = args[:empty_position_placeholder]
    @board = Array.new((@board_size)){Array.new(@board_size ,@empty_position_placeholder)}
    @move_count = 0
  end

  def to_s
    board.map{|row| row.join("|")+"\n"}.join("")
  end

  def undo_move (move)
   y,x = move.divmod(board_size)
   board[y][x] = empty_position_placeholder
   move_count =-1
 end

  def move (player_marker,location)
    return nil if location < 0 || location > ((board_size*board_size)-1)
    y,x = location.divmod(board_size)
    return nil if !(board[y][x] == empty_position_placeholder)
    board[y][x] = player_marker
    move_count =+ 1
  end

  def available_moves
    moves= []
    board.flatten.each_with_index{|x,i| moves.push i if x =="_"}
    moves
 end

  def draw?
    ! (board.flatten.include?(empty_position_placeholder))
  end

  def row_check (matrix)
    winner = nil
    matrix.each do |row|
      winner = row[0] if row.uniq.size == 1 && !(row.include?empty_position_placeholder)
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
    winner = d_one[0] if d_one.uniq.size == 1 && d_one[0] !=empty_position_placeholder
    winner = d_two[0] if d_two.uniq.size == 1 && d_two[0] !=empty_position_placeholder
    winner
  end

  def winner
    if  row_check(board)
      return row_check(board)
    elsif row_check(board.transpose)
      return  row_check(board.transpose)
    elsif diagnoal_check()
      return  diagnoal_check()
    elsif draw?
      return "draw"
    else
      return false
    end
  end
end
