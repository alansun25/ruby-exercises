require_relative 'board'
require_relative 'player'

class Game
  @board
  @winner
  @draw
  @player1
  @player2

  WINNING_COMBOS = [
    [1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9], 
    [1, 5, 9],
    [1, 4, 7], 
    [2, 5, 8], 
    [3, 6, 9], 
    [3, 5, 7]
  ].freeze

  def initialize
    @board = Board.new
    @winner = nil
    @draw = false
    @player1 = nil
    @player2 = nil
  end

  def start
    puts 'Welcome to Tic-Tac-Toe!'
    create_players
    gameplay
  end

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
    until gameover(turn)
      @board.print_board
      turn.odd? ? move(@player1) : move(@player2)
      turn += 1
    end
    @board.print_board
    if @winner
      puts "Game over - #{@winner} wins!"
    else
      puts "It's a draw."
    end
  end

  def move(player)
    puts "#{player.name}'s turn: "
    index = gets.chomp
    @board.update_cell(index, player.icon)
    player.squares.push(index.to_i)
  end

  def gameover(turn)
    if turn >= 5
      WINNING_COMBOS.each_with_index do |c|
        if @player1.squares.intersection(c) == c
          @winner = @player1.name
          return true
        elsif @player2.squares.intersection(c) == c
          @winner = @player2.name
          return true
        end
      end
    end

    return true if @board.cells.all?(String)

    false
  end
end
