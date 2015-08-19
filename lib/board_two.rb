require 'matrix'
class BoardTwo
  attr_accessor :board,:move_count
  attr_reader   :board_size, :empty_position_placeholder,:board_dimension,:board
  def initialize (args)
    @board_size = args[:board_size]
    @board_dimension =args[:dimension]
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

    # board.map{|x| x.index if x=="_"}.reject()
  end

  def draw?
    ! (board.include?(empty_position_placeholder))
  end

  def row_check()

    board.each_slice(board_dimension) do |row|
      return row[0] if row.uniq.size == 1 && !(row[0] == empty_position_placeholder )
    end

  end

  def col_check
     winner = nil
    cols = board.each_slice(board_dimension).to_a.transpose
    cols.each do |row|
      winner = row[0] if row.uniq.size == 1 && row[0] !=empty_position_placeholder
    end
    winner
  end


  def get_diagnoal (rows)
    # rows = board.each_slice(3).to_a
    diagonal = Matrix.rows(rows).each(:diagonal).to_a

  end

  def diagnoal_check()
    diag_one = get_diagnoal(board.each_slice(3).to_a)
    diag_two = get_diagnoal(board.each_slice(3).to_a.reverse)
    return diag_one[0] if diag_one.uniq.size == 1 && (diag_one[0] !=empty_position_placeholder)
    return diag_two[0] if diag_two.uniq.size == 1 && (diag_two[0] !=empty_position_placeholder)
end

  def winner
    if  row_check()
      return row_check()
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


