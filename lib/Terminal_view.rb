class TerminalView

  def initialize
  end

  def welcome
    puts "DON's TIC TAC TOE\n"
  end
  def key
    puts "Move key:\n0|1|2\n3|4|5\n6|7|8\n"
    puts " "
  end
  def clear
    puts "\e[H\e[2J"
  end

  def display output
    puts output
  end

  def get_ans
    gets.downcase
  end
  def get_move
    gets.to_i
  end
end
