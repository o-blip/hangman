class Board
  def initialize
    @wrong_ans = Array.new(7)
    @stock_parts = ['(_)', '|', "\\", '/', '|', '/', "\\"]
    @wrong_count = -1
  end

  def print_board
    puts <<-HEREDOC
_______
|/      |
|      #{@wrong_ans[0]}
|      #{@wrong_ans[2]}#{@wrong_ans[1]}#{@wrong_ans[3]}
|       #{@wrong_ans[4]}
|      #{@wrong_ans[5]} #{@wrong_ans[6]}
|
|___


HEREDOC
  end

  def add_part
    @wrong_count += 1
    @wrong_ans[@wrong_count] = @stock_parts[@wrong_count]

  end
end
