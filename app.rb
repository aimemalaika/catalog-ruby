require_relative 'classes/author'
require_relative 'classes/game'
require './modules/book_module'
require './modules/label_module'
require './inputs/sanchito_inputs'
require_relative 'inputs/inputs'
require_relative 'modules/author_module'

class App
  include AuthorModule
  include AddBooks
  include AddLabels

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @sources = []
    @authors = []
    add_authors(@authors)
    add_books(@books)
    add_labels(@labels)
  end

  def list_all_authors
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    multiplayer, last_played_at, publish_date = grap_game_data
    puts 'Choose an author from the following list using the number'
    list_all_authors
    author_chosen = gets.chomp.to_i
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_game.add_author(@authors[author_chosen - 1])
    @games << new_game
    puts 'The game has been added successfully!'
  end

  def list_all_games
    @games.each_with_index do |game, index|
      puts "#{index + 1}) Last Played: #{game.last_played_at}
            Multiplayer: #{game.multiplayer}
            publish: #{game.publish_date}
            author: #{game.author.first_name} #{game.author.last_name}"
    end
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts "[#{index + 1}] Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "[#{index + 1}] Title: #{label.title}, Color: #{label.color}, Items: #{label.items}, ID: #{label.id}"
    end
  end

  def add_book
    puts "Let's create a book!"
    publisher, cover_state = grap_book_data

    puts "\nChoose a label from the following list using a number"
    sleep(1)
    list_all_labels
    print "\nYour selected label: "
    label_chosen = gets.chomp.to_i
    new_book = Book.new(publisher, cover_state)
    new_book.add_label(@labels[label_chosen - 1])
    @books << new_book
    puts "\nBook created successfully!"
    puts "\n\n...Returning to main menu...\n\n"
    sleep(1)
  end
end
