# this game has one class, Game
class Game
  @@turn_count = 1
  @@winner = ''

  attr_accessor :player_one_name, :player_two_name

  def initialize
    puts 'Player 1 - enter your name!'
    @player_one_name = gets.chomp
    puts 'Player 2 - enter your name!'
    @player_two_name = gets.chomp
    @board = Array.new(3) { Array.new(3, '_') }
  end

  # blank board showing in console
  def display_board(board)
    puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
    puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
    puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
  end

  # check for winners before each turn
  # repetetive winner and turn count, turn this into a method and repeat that method each time instead.
  def game_status
    
    flat = @board.flatten
    
    # check 3 across
    if @board.each do |i|
      if i.all? { |j| j == 'X' }
        @@winner = 'X'
        @@turn_count = 11
      elsif i.all? { |j| j == 'O' }
        @@winner = 'O'
        @@turn_count = 11
      end
    end

    # check 3 down
    elsif flat.each_with_index do |v, i|
      if v == 'X' && flat[i + 3] == 'X' && flat[i + 6] == 'X'
        @@winner = 'X'
        @@turn_count = 11
      elsif v == 'O' && flat[i + 3] == 'O' && flat[i + 6] == 'O'
        @@winner = 'O'
        @@turn_count = 11
      end
    end

    # check diagonal
    elsif center_val = @board[1][1]
      if @board[0][0] && @board[2][2] == center_val
        @@winner = center_val
        @@turn_count = 11
      elsif @board[2][0] && @board[0][2] == center_val
        @@winner = center_val
        @@turn_count = 11
      end
    end
  end

  def player_turn(turn)
    if turn.odd?
      player_choice(@player_one_name, 'O')
    else
      player_choice(@player_two_name, 'X')
    end
  end

  def player_choice(player, symbol)
    puts "#{player} please enter your coordinates (0..2) separated by a space"
    input = gets.chomp
    input_array = input.split
    coord_one = input_array[0].to_i
    coord_two = input_array[1].to_i

    # until the user includes a space and coords between 0 and 2 for an empty square, prompt for coord
    until input.match(/\s/) && coord_one.between?(0, 2) && coord_two.between?(0, 2) && @board[coord_one][coord_two] == '_'
      puts 'Please enter valid coordinates for an empty space in the grid'
      input = gets.chomp
      input_array = input.split
      coord_one = input_array[0].to_i
      coord_two = input_array[1].to_i
    end

    add_to_board(coord_one, coord_two, symbol)
  end

  def add_to_board(coord_one, coord_two, symbol)
    @board[coord_one][coord_two] = symbol
    @@turn_count += 1
  end

  def declare_result(symbol)
    case symbol
    when 'O'
      puts "#{@player_one_name} wins the game!"
    when 'X'
      puts "#{@player_two_name} wins the game!"
    else
      puts "It's a tie!"
    end
  end

  def play_game
    puts "\r\n"
    puts 'Here is your empty battlefield!'
    puts "\r\n"
    display_board(@board)
    puts "\r\n"

    until @@turn_count >= 10 do
      game_status                           # checks for winner
      player_turn(@@turn_count)             # evals whose turn it is
      display_board(@board)                 # displays board each turn
      puts @@winner
      puts @@turn_count
    end

    declare_result(@symbol)
  end
end

puts 'Welcome to tic-tac-toe. The rules are as expected, but choosing placement requires coordinates.'
puts 'Each turn, enter two numbers with a space, per the grid layout below:'
puts "\r\n"
puts '0 0 | 0 1 | 0 2'
puts '1 0 | 1 1 | 1 2'
puts '2 0 | 2 1 | 2 2'
puts "\r\n"

game = Game.new
game.play_game