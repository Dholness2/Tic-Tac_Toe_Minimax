class TerminalView
   attr_accessor :input, :output
  def initialize()
    @input  = $stdin
    @output = $stdout
  end

  def welcome
    puts "DON's TIC TAC TOE\n"
  end
  def key
    puts "Move key:\n1|2|3\n4|5|6\n7|8|9\n"
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
   "Select your move : \n"
    move = input.gets.chomp
    return move.to_i if move =~/^[1-9]$/
    output.puts "Invalid move"
  end

  def board board
   puts "#{board[0]}#{board[1]}#{board[2]}"
   puts "#{board[3]}#{board[4]}#{board[5]}"
   puts "#{board[6]}#{board[7]}#{board[7]}"
 end
end
