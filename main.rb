class Main
  def initialize
    puts "****************************\n*       MY CATALOGUE       *\n****************************\n\n\n"
    puts "Select an option:\n--------------------\n"
    puts "1. Add item to catalogue \n2. Move to archive \n3. Exit"
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
end

Main.new
