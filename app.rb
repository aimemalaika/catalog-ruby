require 'json'
require_relative './classes/genre'
require_relative './modules/list_genre'
require_relative './classes/albums'
require_relative './modules/list_album'
require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'modules/author_module'
require_relative 'store/game_read'
require_relative 'store/game_store'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'inputs/inputs'
require_relative 'inputs/new_book_input'
require_relative 'store/store_books'
require_relative 'store/store_labels'
require_relative 'store/load_books'
require_relative 'store/load_labels'

BOOKS_FILE = 'data/books.json'.freeze
LABELS_FILE = 'data/labels.json'.freeze

class App
  include AuthorModule
  include BookModule
  include LabelModule
  include GenreList
  include ManageAlbums

  def initialize
    @labels = grab_labels
    @books = grab_books
    @music_albums = load_albums
    @games = read_games
    @genres = load_genres
    @movies = []
    @sources = []
    @authors = []
    save_genres
    add_authors(@authors)
    add_default_books(@books) unless @books.length.positive?
    add_default_labels(@labels) unless @labels.length.positive?
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
      puts "
      id: #{album['id']}
      publish_date: (#{album['publish_date']})
      Archived: #{album['archived']}
      On spotify: #{album['on_spotify']}"
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
    puts "\n\n\nBooks:\n------------"
    @books.each_with_index do |book, index|
      puts "
      [#{index + 1}]
      Publisher: #{book.publisher},
      Cover State: #{book.cover_state}"
    end
  end

  def list_all_labels
    puts "\n\n\nLabels:\n------------"
    @labels.each_with_index do |label, index|
      puts "[#{index + 1}] Title: #{label.title}, Color: #{label.color} ID: #{label.id}"
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
    new_book_input
  end

  def save_books
    store_books
  end

  def save_labels
    store_labels
  end

  def grab_labels
    load_labels
  end

  def grab_books
    load_books
  end

  def list_all_movies
    puts 'Build pending... not currently available.'
  end

  def list_all_sources
    puts 'Build pending... not currently available.'
  end

  def add_movie
    puts 'Build pending... not currently available.'
  end
end
