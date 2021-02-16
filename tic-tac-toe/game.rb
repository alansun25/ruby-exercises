# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# A tic-tac-toe game. Creates the players and game board, and lets players make moves.
class Game
  WINNING_COMBOS = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9], [3, 5, 7]
  ].freeze

  def initialize
    @board = Board.new
    @winner = nil
    @player_one = nil
    @player_two = nil
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
    @player_one = Player.new(name1, symbol1)
    puts 'Enter player two\'s name:'
    name2 = gets.chomp
    while name2 == name1
      puts 'Players one and two cannot have the same name. Please try again:'
      name2 = gets.chomp
    end
    puts 'Enter player two\'s symbol:'
    symbol2 = gets.chomp
    while symbol2 == symbol1
      puts 'Players one and two cannot have the same symbol. Please try again:'
      symbol2 = gets.chomp
    end
    @player_two = Player.new(name2, symbol2)
  end

  def gameplay
    # Play Tic-Tac-Toe!
    puts 'During each turn, enter the index of the square you wish to take.'
    turn = 1
    until gameover(turn)
      @board.print_board
      turn.odd? ? move(@player_one) : move(@player_two)
      turn += 1
    end
    @board.print_board
    if @winner
      puts "Game over - #{@winner} wins!"
    else
      puts "It's a draw."
    end

    replay
  end

  def move(player)
    puts "#{player.name}'s turn: "
    index = gets.chomp
    until valid_move(index.to_i)
      puts 'Invalid move. Please try again:'
      index = gets.chomp
    end
    @board.update_cell(index, player.icon)
    player.squares.push(index.to_i)
  end

  def gameover(turn)
    # Game is over if someone wins or a draw is reached.
    if turn >= 5
      WINNING_COMBOS.each do |c|
        if @player_one.squares.intersection(c) == c
          @winner = @player_one.name
          return true
        elsif @player_two.squares.intersection(c) == c
          @winner = @player_two.name
          return true
        end
      end
    end
    return true if @board.cells.all?(String) # Draw

    false
  end

  def valid_move(index)
    # Check if move is in the scope of the board and that the space is not already taken.
    index.between?(1, 9) && @board.cells[index - 1].is_a?(Numeric)
  end

  def replay
    # Gives the players an option to play again.
    puts 'Play again? (y/n):'
    response = gets.chomp
    until %w[y n].include?(response)
      puts 'Please enter \'y\' or \'n\'.'
      response = gets.chomp
    end
    if response == 'y'
      initialize
      start
    else
      puts 'Thanks for playing!'
    end
  end
end
