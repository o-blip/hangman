class Player
  def guess_letter(word)
    letter = gets.chomp.downcase
    return letter if letter == word
    check_guess(letter)
    letter
  end

  def check_guess(letter)
    if letter.length > 1
      puts 'Invalid guess, guess 1 letter'
      self.guess_letter
    elsif !letter?(letter) 
      puts 'Invalid guess, guess a letter'
      self.guess_letter
    end

  def letter?(char)
    char =~ /[A-Za-z]/
  end
end