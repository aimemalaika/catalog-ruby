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

def menu_one(option, app)
  case option
  when 1 then app.list_all_books
  when 2 then app.list_all_music_albums
  when 3 then app.list_all_movies
  when 4 then app.list_all_games
  when 5 then app.list_all_genres
  when 6 then app.list_all_labels

  end
end

def menu_two(option, app)
  case option
  when 7 then app.list_all_authors
  when 8 then app.list_all_sources
  when 9 then app.add_book
  when 10 then app.add_music_album
  when 11 then app.add_movie
  when 12 then app.add_game
  end
end

def main
  app = App.new
  option = ''
  loop do
    display_list
    option = gets.chomp.to_i
    if option.positive? && option < 7
      menu_one(option, app)
    elsif option >= 7 && option < 13
      menu_two(option, app)
    elsif option == 13
      app.save_books
      app.save_labels
      break
    else
      puts "Invalid option, please try again\n--------------------\n\n\n"
    end
  end
  puts "\n\n\n********************\n*     Goodbye!     *\n********************\n"
end

main
