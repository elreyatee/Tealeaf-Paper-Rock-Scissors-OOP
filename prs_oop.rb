# Ellery Temple
# 10/26/14
# Paper-Rock-Scissors OOP

class Player
  attr_accessor :choice

  CHOICES = {'p' => 'paper', 'r' => 'rock', 's' => 'scissors'}

  def initialize; end

  def move
    loop do
      c = gets.chomp.downcase
  
      if valid_choice?(c)
        puts "You chose #{CHOICES[c]}."
        choice = c
        return choice
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

  def move
    choice = CHOICES.keys.sample
    puts "Computer chose #{CHOICES[choice]}."
    choice
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
      winner(self.player.move, self.computer.move)
      break if play_again? == 'n'
      system 'clear'
    end
    puts "Thanks for playing!"
  end

  private

  def valid?(a)
    ['y', 'n'].include?(a)
  end

  def winner(p, o)
    case  
    when p == 'p' && o == 'r'
      puts "You won! Paper beats rock!"
    when p == 'p' && o == 's'
      puts "You lost! Scissors cuts paper!"
    when p == 'r' && o == 's'
      puts "You won! Rock crushes scissors!"
    when p == 'r' && o == 'p'
      puts "You lost! Paper covers rock!"
    when p == 's' && o == 'p'
      puts "You won! Scissors cuts paper!"
    when p == 's' && o == 'r'
      puts "You lost! Rock crushes scissors!"
    when p == o
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



