class HumanPlayer
  attr_reader :marker,:name
  attr_accessor :current_move,:view
  def initialize(args={})
    @name = args[:name]
    @marker = args[:marker]
    @current_move = args[:move]
    @view = args[:view]
  end

  def set_name input
    @name = input
  end

  def set_marker input
    @marker = input
  end

  def validated_move (move,board)
    return nil unless move.is_a? Integer
    return nil if move < 0 || move > ((board.board_size*board.board_size)-1)
    true
  end

  def get_move (board)
    view.display "select your next move #{name}"
    current_move  = view.get_move
    until validated_move(current_move,board)
      view.display "invalid move, Select again?"
      current_move = view.get_move
    end
    board.move(marker,current_move)
  end
end
