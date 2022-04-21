require 'json'
require_relative './classes/genre'
require_relative './modules/list_genre'
require_relative './classes/albums'
require_relative './modules/list_album'
require_relative 'classes/author'
require_relative 'classes/game'
require './modules/book_module'
require './modules/label_module'
require './inputs/sanchito_inputs'
require_relative 'inputs/inputs'
require_relative 'modules/author_module'
require_relative 'store/game_read'
require_relative 'store/game_store'

class App
  include AuthorModule
  include AddBooks
  include AddLabels
  include GenreList
  include ManageAlbums

  def initialize
    @books = []
    @music_albums = load_albums
    @movies = []
    @games = read_games
    @genres = load_genres
    @labels = []
    @sources = []
    save_genres
    @authors = []
    add_authors(@authors)
    add_books(@books)
    add_labels(@labels)
  end

  def list_all_genres
    puts "\n\n\nGenres:\n------------"
    index = 1
    @genres.each do |genre|
      puts "#{index}. #{genre['name']}"
      index += 1
    end
    puts "\n--------------------\n\n\n"
  end

  def list_all_authors
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def list_all_music_albums
    puts "\n\n\nAlbums:\n------------"
    @music_albums.each do |album|
      puts "id: #{album['id']}) publish_date: (#{album['publish_date']}) Archived: #{album['archived']}  On spotify: #
  {album['on_spotify']}"
    end
    puts "\n--------------------\n\n\n"
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
    save_games(@games)
  end

  def list_all_games
    @games.each_with_index do |game, index|
      puts "
        #{index + 1}) Last Played: #{game.last_played_at}
        Multiplayer: #{game.multiplayer}
        publish: #{game.publish_date}"
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

  def add_music_album
    index = 1
    puts 'Select genre:'
    @genres.each do |genre|
      puts "#{index}. #{genre['name']}"
      index += 1
    end
    genre_index = gets.chomp.to_i
    puts 'Enter publication date of the album:'
    publish_date = gets.chomp
    puts 'Is the album archived? (y/n)'
    archived = gets.chomp == 'y'
    puts 'Is the album on Spotify? (y/n)'
    on_spotify = gets.chomp == 'y'
    new_album = MusicAlbum.new(publish_date, archived, on_spotify)
    @music_albums << { 'publish_date' => publish_date, 'archived' => archived, 'on_spotify' => on_spotify,
                       'id' => new_album.id, 'genre' => @genres[genre_index - 1]['name'] }
    save_music_albums
    puts "\n\n\nAlbum added!\n------------\n\n\n"
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
