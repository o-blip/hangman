class Player
  def guess_letter(word)
    letter = gets.chomp.downcase
    if letter == word
      return letter
    end
    if letter.length > 1
      puts 'Invalid guess, guess 1 letter'
      self.guess_letter
    elsif !letter?(letter) 
      puts 'Invalid guess, guess a letter'
      self.guess_letter
    end
    letter
  end

  def letter?(char)
    char =~ /[A-Za-z]/
  end
end