class Player
  def initialize(args={})
    @name = args[:name]
    @marker = args[:marker]
    @move = args[:move]
  end

  def set_name input
    @name = input
  end

  def set_marker input
    @marker = input
  end

  def update_move input
    @move = input
  end

  def get_move
    @move
  end

end
