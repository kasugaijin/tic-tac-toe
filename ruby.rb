# this game has one class, Game
class Game
  @@turn_count = 1
  attr_accessor :player_one_name, :player_two_name

  def initialize
    puts 'Player 1 - enter your name!'
    @player_one_name = gets.chomp
    puts 'Player 2 - enter your name!'
    @player_two_name = gets.chomp
    @board = Array.new(3) { Array.new(3, '_') }
  end

  # blank board showing on console
  def display_board(board)
    puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
    puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
    puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
  end

  def game_status
    # if 3 in a row
      # stop game loop by making @@turn_count = 11?
      # execute declare winner(cell content/symbol)
    # else
      # execute player_turn(@@turn)
    
    if
    #check for 3 across - put this into its own method, if it returns false it skips to next
    @board.each do | i |
      if i.all? {|j| j == "X"}
        @@turn_count = 11         #try removing later
        declare_winner("X")
      elsif i.all? { |j| j == "O"}
        @@turn_count = 11
        declare_winner("O")         #try removing later 
      end
    end

  elsif
    #check for 3 down - put this into its own method, if it returns false it skips to next
    flat = @board.flatten
    flat.each_with_index do |v, i|
      if v == 'X' && flat[i + 3] == 'X' && flat[i + 6] == 'X'
        declare_winner("X")
      elsif v == 'O' && flat[i + 3] == 'O' && flat[i + 6] == 'O'
        declare_winner("O")
      end
    end

  elsif
    #check diagonals - put this into its own method, if it returns false it skips to next

  else 
    player_turn(@@turn_count)

    

  def player_turn(turn)
    # if turn % 2 != 0 (i.e. odd number = player 1, even = player 2)
      #execute player_choice('one', 'O')  
    #else
    #execute player_choice('two, 'X')  
  end

  def player_choice(player, symbol)
      # symbol = symbol
      # puts 'Player #{player} - enter your coordinates (two numbers separated by a space)'
      # coord = gets.chomp.split.to_i
      # loop until the gets is a legal entry && board coord is empty
      # then execute add_to_board(coord, symbol) 
  end

  def add_to_board(coord, symbol)
     # add symbol to array coord
     # @@turn_count +=1
  end

  def declare_winner(symbol)
     #if symbol == 'O' 
        #puts @player_one winner
     #else puts @player_two winner
  end

  # def end_game
  #   puts 'to play again enter "Y"'
  #   response = gets.chomp
  #   while response != "Y"
  #     puts 'to play again enter "Y"'
  #     response
  #   end
  #   game = Game.new
  #   game.play_game
  # end

  def play_game
    puts "\r\n"
    puts 'Here is your empty battlefield!'
    puts "\r\n"
    display_board(@board)
    #until @@game count <=10
      #game_status
    #end
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
# do you run game.end_game here? or in play_game