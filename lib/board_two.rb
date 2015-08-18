class BoardTwo
  attr_accessor :board,:move_count
  attr_reader   :board_size, :empty_position_placeholder,:board
  def initialize (args)
    @board_size = args[:board_size]
    @empty_position_placeholder = args[:empty_position_placeholder]
    @board = Array.new(@board_size){@empty_position_placeholder}
    @move_count = 0
  end

  def undo_move (move)
   board[move] = empty_position_placeholder
   move_count =-1
 end

  def move (player_marker,location)
    return nil if location < -1 || location > (board_size)
    return nil if !(board[location] == empty_position_placeholder)
    board[location] = player_marker
    move_count =+ 1
  end

  def available_moves
     moves= []
     board.each_with_index{|x,i| moves.push i if x =="_"}
     moves
 end

  def draw?
    ! (board.include?(empty_position_placeholder))
  end

  def row_check
    winner = nil
    rows = [[board[0],board[3],board[6]],[board[1],board[4],board[7]],[board[2],board[5],board[8]]]
    rows.each do |row|
      winner = row[0] if row.uniq.size == 1 && !(row.include?empty_position_placeholder)
    end
    winner
  end

  def col_check
     winner = nil
    cols = [[board[0],board[3],board[6]],[board[1],board[4],board[7]],[board[6],board[7],board[8]]]
    cols.each do |col|
      winner = col[0] if col.uniq.size == 1 && !(col.include?empty_position_placeholder)
    end
    winner

  end

  def diagnoal_check()
    winner = nil
    d_one =  [board[0],board[4],board[8]]
    d_two = [board[2],board[4],board[6]]
    winner = d_one[0] if d_one.uniq.size == 1 && d_one[0] !=empty_position_placeholder
    winner = d_two[0] if d_two.uniq.size == 1 && d_two[0] !=empty_position_placeholder
    winner
  end

  def winner
    if  row_check
      return row_check
    elsif col_check
      return  col_check
    elsif diagnoal_check()
      return  diagnoal_check()
    elsif draw?
      return "draw"
    else
      return false
    end
  end
end
