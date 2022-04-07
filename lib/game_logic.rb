# 1. load in dictionary
# 2. choose 5-12 character word from dictionary
# 3. let the player guess a letter (case insensitive)
# 4. display and update correct letters (_ _ _ l _ w _ r l d)
# 5. show guessed letters
# 6. if out of guess, player loses
# 7. add serialize functionality (save game state and option to load in the beginning)


class Game
  def initialize
    @word = File.readlines('words.txt', chomp:true).sample
    until @word.length > 4 && @word.length < 13
      @word = File.readlines('words.txt', chomp:true).sample
    end
    @player = Player.new
    @guesses = @word.length + 5
    @hidden_word = Array.new(@word.length, "-")
    @guessed_letters = ''
  end

  def round
    puts @hidden_word.join(' ')
    puts @guessed_letters

    guess = @player.guess_letter(@word)
    if guess == @word
      puts 'you win'
      return
    end

    return if check_repeat(guess)

    check_guess(guess)
    

    @guesses -= 1
    puts "\n#{@guesses} left"
  end 

  def play
    while @guesses.positive?
      self.round
      if @hidden_word.join == @word
        puts 'You got the word!'
        return
      end
    end
    p @word
  end

  def check_repeat(guess)
    if @guessed_letters.include?(guess)
      puts 'Already guessed this letter, guess again'
      return true
    else 
      return false
    end
  end

  def check_guess(guess)
    @guessed_letters += guess
    if @word.include?(guess)
      replace_letter(guess)
    else
      puts 'Letter not found'
    end
  end

  def replace_letter(guess)
    @word.split('').each_with_index do |letter, index|
      if letter == guess
        @hidden_word[index] = guess 
      end
    end
  end 
end



game = Game.new.play
