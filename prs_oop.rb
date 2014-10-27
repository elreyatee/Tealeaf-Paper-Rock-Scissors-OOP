# Ellery Temple
# 10/26/14
# Paper-Rock-Scissors OOP

class Player

  attr_accessor :choice

  CHOICES = {'p' => 'paper', 'r' => 'rock', 's' => 'scissors'}

  def initialize; end

  def to_s
    "You chose #{CHOICES[choice]}."
  end

  def move
    loop do
      self.choice = gets.chomp.downcase
  
      if valid_choice?(self.choice)
        puts self 
        return self.choice
      end
    end
  end

  private

  def valid_choice?(move)
    if CHOICES.keys.include?(move)
      true 
    else
      puts "Invalid choice, please try again."
      false
    end
  end


end

class Computer < Player

  def initialize; end

  def to_s
    "Computer chose #{CHOICES[choice]}."
  end

  def move
    self.choice = CHOICES.keys.sample
    puts self 
    self.choice 
  end
end

class GamePlay
  attr_accessor :player, :computer

  def initialize
    puts "Play Paper, Rock, Scissors!"
    self.player = Player.new
    self.computer = Computer.new
  end

  def run
    loop do
      puts "Choose one: (P/R/S)"
      compare
      break if play_again? == 'n'
      system 'clear'
    end
    puts "Thanks for playing!"
  end

  private

  def valid?(a)
    ['y', 'n'].include?(a)
  end

  def compare
    p = player.move
    c = computer.move
    case  
    when p == 'p' && c == 'r'
      puts "You won! Paper beats rock!"
    when p == 'p' && c  == 's'
      puts "You lost! Scissors cuts paper!"
    when p == 'r' && c == 's'
      puts "You won! Rock crushes scissors!"
    when p == 'r' && c == 'p'
      puts "You lost! Paper covers rock!"
    when p == 's' && c  == 'p'
      puts "You won! Scissors cuts paper!"
    when p == 's' && c  == 'r'
      puts "You lost! Rock crushes scissors!"
    else
      puts "There's a tie!"
    end
  end

  def play_again?
    puts "Would you like to play again?(Y/N)"

    loop do
      answer = gets.chomp.downcase
      if valid?(answer) 
        return answer
      else
        puts "Invalid selection. Try again."
      end
    end
  end
end

GamePlay.new.run



