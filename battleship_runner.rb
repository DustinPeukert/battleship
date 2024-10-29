require_relative './spec/spec_helper'

def get_main_menu_input
  input = ''

  while input != 'p' && input != 'q'
    input = gets.chomp
    
    if input != 'p' && input != 'q'
      puts 'Enter p to play. Enter q to quit.'
    elsif input == 'q'
      exit
    end
  end
end

def get_coordinate_inputs(ship)
  loop do
    input = gets.chomp.split
    
    if !@player_board.valid_placement?(ship, input)
      puts "Those are invalid coordinates. Please try again:\n"
    elsif @player_board.valid_placement?(ship, input)
      return input
    end
  end
end

def get_shot_coordinate
  loop do 
    input = gets.chomp 
    
    if !@cpu_board.valid_coordinate?(input)
      puts "Please enter a valid coordinate:\n"
    elsif @cpu_board.valid_coordinate?(input)
      return input
    end
  end
end

loop do
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit.\n"
  get_main_menu_input
  puts " "

  @cpu_board = Board.new
  cpu = CPU.new(@cpu_board)

  cpu_cruiser = Ship.new("Cruiser", 3)
  cpu_sub = Ship.new("Submarine", 2)

  cpu.place_ship(cpu_cruiser)
  cpu.place_ship(cpu_sub)

  @player_board = Board.new
  player = Player.new(@player_board)
  tracked_coordinates = []

  player_cruiser = Ship.new("Cruiser", 3)
  player_sub = Ship.new("Submarine", 2)

  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The cruiser is 3 units long and the Submarine is two units long."
  puts @player_board.render(true)
  puts "Enter the squares for the Cruiser (3 spaces)"
  puts "Example: A1 B1 C1"

  coordinates = get_coordinate_inputs(player_cruiser)
  puts " "
  player.place(player_cruiser, coordinates)

  puts @player_board.render(true)
  puts "Enter the squares for the Submarine (2 spaces):"
  puts "Example: C2 D2"

  coordinates = get_coordinate_inputs(player_sub)
  puts " "
  player.place(player_sub, coordinates)

  loop do
    puts "=============COMPUTER BOARD============="
    puts @cpu_board.render(true) # turn this off when done
    puts " "
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
    
    puts "Enter the coordinate for your shot:\n"

    player_coordinate = get_shot_coordinate
    while tracked_coordinates.include?(player_coordinate)
      puts "Already fired upon. Choose a different coordinate:\n"
      player_coordinate = get_shot_coordinate

      if !tracked_coordinates.include?(player_coordinate)
        break
      end
    end

    tracked_coordinates << player_coordinate
    puts " "
    player.fire_at(@cpu_board, player_coordinate)

    cpu_coordinate = cpu.fire_at(@player_board)

    if @cpu_board.cells[player_coordinate].render == "M"
      puts "Your shot on #{player_coordinate} was a miss!"
    elsif @cpu_board.cells[player_coordinate].render == "X"
      puts "Your shot on #{player_coordinate} sunk my ship!"
    elsif @cpu_board.cells[player_coordinate].render == "H"
      puts "Your shot on #{player_coordinate} hit my ship!"
    end

    if @player_board.cells[cpu_coordinate].render == "M"
      puts "My shot on #{cpu_coordinate} was a miss!"
    elsif @player_board.cells[cpu_coordinate].render == "X"
      puts "My shot on #{cpu_coordinate} sunk your ship!"
    elsif @player_board.cells[cpu_coordinate].render == "H" 
      puts "My shot on #{cpu_coordinate} hit your ship!"
    end

    puts " "

    if player.has_lost? || cpu.has_lost? 
      break
    end
  end

  if player.has_lost?
    puts "I am the winner!"
  elsif cpu.has_lost?
    puts "You are the winner!"
  end

  puts " "
end