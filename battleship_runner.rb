require_relative './spec/spec_helper'

#method for main_menu input
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
#method for player shot input

#method for player placement input

loop do
  puts "Welcome to BATTLESHIP\n"
  puts "Enter p to play. Enter q to quit.\n"
  get_main_menu_input
#display main_menu - FINISHES
  #choose play or quit - FINISHED
  #quit should close the program - FINISHED
  #play will continue - FINISHED


#computer to place its ships

#user is prompted to place ships
#should output short explanation on how to place ships
  # I have laid out my ships on the grid.
  # You now need to lay out your two ships.
  # The Cruiser is three units long and the Submarine is two units long.
  #   1 2 3 4
  # A . . . .
  # B . . . .
  # C . . . .
  # D . . . .
  # Enter the squares for the Cruiser (3 spaces):

#get user input
#check that its valid
#format
#pass input as argument for player.place

#prompted to place other ship
  # Enter the squares for the Cruiser (3 spaces):
  # > A1 A2 A3

  #   1 2 3 4
  # A S S S .
  # B . . . .
  # C . . . .
  # D . . . .
  # Enter the squares for the Submarine (2 spaces):

#get user input
#check that its valid
#format
#pass input as argument for player.place

#if placement invalid:
  # Enter the squares for the Submarine (2 spaces):
  # > C1 C3
  # Those are invalid coordinates. Please try again:
  # > A1 B1
  # Those are invalid coordinates. Please try again:
  # > C1 D1

#Main GAME:

#Gameplay Loop
  #Display boards; player can see own ships, but not cpu's
  #Player fires
  #Cpu fires
  #Shows player shot results
  #shows cpu shot results
    #Missed shot
    #hit shot
    #sinks a ship
#It is possible that the user enters a coordinate they have 
#already fired upon. You need to add something that informs 
#the user that this is the case. You may choose to either 
#prompt them again for a coordinate they haven’t fired on, 
#or let them choose it again and inform them in the results 
#phase that they selected this coordinate again.

#Game ends when someone has no ships left

#They should be returned to the main menu and asked to play
#or quit again
end