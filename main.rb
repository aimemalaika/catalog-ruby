require_relative 'app'

def main
  app. App.new
  puts "****************************\n*       MY CATALOGUE       *\n****************************\n\n\n"
  puts "Select an option:\n--------------------\n"
  puts "1. List all books \n2. List all music albums \n3. List all movies"
  puts "4. List of games \n5. List all genres (e.g 'Comedy', 'Thriller') \n6. List all labels (e.g. 'Gift', 'New')"
  puts "7. List all authors (e.g. 'Stephen King') \n8. List all sources (e.g. 'From a friend', 'Online shop') \n9. Add a book"
  puts "10. Add a music album \n11. Add a movie \n12. Add a game"
  puts "13. Exit"

  option = gets.chomp
  while option != '3'
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
    option = gets.chomp
  end
  puts "\n\n\n********************\n*     Goodbye!     *\n********************\n"
end

main
