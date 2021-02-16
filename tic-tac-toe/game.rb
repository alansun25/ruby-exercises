require_relative 'board'
require_relative 'player'

class Game
  @board
  @winner
  @draw
  @player1
  @player2

  WINNING_COMBOS = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9], [3, 5, 7]
  ]

  def initialize
    @board = Board.new
    @winner = false
    @draw = false
  end

  def start
    puts 'Welcome to Tic-Tac-Toe!'
    create_players
    gameplay
  end

  # ----------------- #

  private

  def create_players
    puts 'Enter player one\'s name:'
    name1 = gets.chomp
    puts 'Enter player one\'s symbol:'
    symbol1 = gets.chomp
    @player1 = Player.new(name1, symbol1)
    
    puts 'Enter player two\'s name:'
    name2 = gets.chomp
    puts 'Enter player one\'s symbol:'
    symbol2 = gets.chomp
    @player2 = Player.new(name2, symbol2)
  end

  def gameplay
    puts 'During each turn, enter the value of the square you wish to take.'
    turn = 1
    until @winner || @draw
      @board.print_board
      if turn % 2 == 1
        puts "#{@player1.name}'s turn: "
        move(@player1)
      else
        puts "#{@player2.name}'s turn: "
        move(@player2)
      end
      turn += 1
    end
    puts "Game over! #{@winner} wins!" if @winner
    puts "It's a draw!" if @draw
  end

  def move(player)
    index = gets.chomp
    @board.update_cell(index, player.icon)
    player.squares.push(index)
  end
end
