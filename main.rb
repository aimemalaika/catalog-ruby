require_relative 'app'

def display_list
  puts "****************************\n*       MY CATALOGUE       *\n****************************\n\n\n"
  puts "Select an option:\n--------------------\n"
  puts "
    1. List all books 
    2. List all music albums 
    3. List all movies
    4. List of games 
    5. List all genres (e.g 'Comedy', 'Thriller') 
    6. List all labels (e.g. 'Gift', 'New')
    7. List all authors (e.g. 'Stephen King')
    8. List all sources (e.g. 'From a friend', 'Online shop') 
    9. Add a book
    10. Add a music album
    11. Add a movie 
    12. Add a game
    13. Exit"
end

def main
  app = App.new
  option = ""
  while option != '3'
    display_list
    option = gets.chomp
    case option
    when '1'
      puts "Add item to catalogue\n--------------------\n"
    when '2'
      puts "Move to archive\n--------------------\n"
    else
      puts "Invalid option\n--------------------\n"
    end
    puts 'Select an option:'
    puts "1. Add item to catalogue \n2. Move to archive \n3. Exit"
  end
  puts "\n\n\n********************\n*     Goodbye!     *\n********************\n"
end

main
