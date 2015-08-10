class TerminalView

  def initialize
  end

  def clear
  puts "\e[H\e[2J"
  end

  def display output
    puts output
  end

  def get_move
      gets.to_i
  end
end