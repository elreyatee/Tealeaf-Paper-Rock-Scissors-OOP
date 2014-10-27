# Ellery Temple
# 10/26/14
# Paper-Rock-Scissors OOP

class Player
  attr_accessor :choice

  CHOICES = {'p' => 'paper', 'r' => 'rock', 's' => 'scissors'}

  def initialize; end

  def valid_choice?(move)
    if CHOICES.keys.include?(move)
      true 
    else
      puts "Invalid choice, please try again."
      false
    end
  end

  def move
    loop do
      choice = gets.chomp.downcase
  
      if valid_choice?(choice) == true
        puts "You chose #{CHOICES[choice]}."
        return choice
      end
     end
  end
end

class Computer < Player
  attr_accessor :choice

  def initialize; end

  def move
    choice = CHOICES.keys.sample
    puts "Computer chose #{CHOICES[choice]}"
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

  def valid?(a)
    if ['y', 'n'].include?(a) 
      true 
    else
      puts "Invalid selection."
      false
    end
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
    else
      puts "There's a tie!"
    end
  end

  def play_again?
    answer = ""
    loop do
      puts "Would you like to play again?(Y/N)"
      answer = gets.chomp.downcase
      if valid?(answer) 
        break 
      else
        puts "Invalid selection."
      end
    end
    answer
  end

  def run
    loop do
      puts "Choose one: (P/R/S)"
      winner(self.player.move, self.computer.move)
      break if play_again? == 'n'
    end
    puts "Thanks for playing!"
  end
end

GamePlay.new.run



