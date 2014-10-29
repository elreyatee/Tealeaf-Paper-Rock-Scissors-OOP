# Ellery Temple
# 10/26/14
# Paper-Rock-Scissors OOP

class Player

  attr_accessor :choice
  attr_reader :name

  CHOICES = {'p' => 'paper', 'r' => 'rock', 's' => 'scissors'}

  def initialize(n)
    @name = n
  end

  def move
    begin
      self.choice = gets.chomp.downcase

      puts "Invalid choice, please try again." if !valid_choice?
    end until valid_choice?
    puts self
    self.choice
  end

  private

  def valid_choice?
    CHOICES.keys.include?(choice) ? true : false
  end

  def to_s
    "#{name} chose #{CHOICES[choice]}."
  end
end

class Computer < Player

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
    @player = Player.new('Player')
    @computer = Computer.new('Computer')
  end

  def run
    loop do
      puts "Choose one: (P/R/S)"
      compare_moves
      break if replay == 'n'
      system 'clear'
    end
    puts "Thanks for playing!"
  end

  private

  def valid?(a)
    ['y', 'n'].include?(a)
  end

  def compare_moves

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

  def replay
    puts "Would you like to play again?(Y/N)"

    begin
      answer = gets.chomp.downcase

      puts "Invalid selection. Try again." if !valid?(answer)
    end until valid?(answer)

    answer
  end
end

GamePlay.new.run



