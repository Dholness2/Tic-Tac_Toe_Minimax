class TerminalView
   attr_accessor :input, :output
  def initialize()
    @input  = $stdin
    @output = $stdout
  end

  def welcome
    output.puts "DON's TIC TAC TOE\n"
  end
  def key
    output.puts "Move key:\n1|2|3\n4|5|6\n7|8|9\n"
    output.puts " "
  end
  def clear
    output.puts "\e[H\e[2J"
  end

  def display message

    output.puts message
  end

  def get_ans
    input.gets.downcase
  end
  def get_move
   "Select your move : \n"
    move = input.gets.chomp
    return (move.to_i-1) if move =~/^[1-9]$/
    output.puts "Error"
  end

  def board board
   puts "#{board[0]}\n+#{board[1]}\n#{board[2]}"

 end
end
