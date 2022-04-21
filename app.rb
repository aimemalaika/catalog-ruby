require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'modules/author_module'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'inputs/inputs'
require_relative 'inputs/new_book_input'
require_relative 'store/store_books'
require_relative 'store/store_labels'
require_relative 'store/load_books'
require_relative 'store/load_labels'
require 'json'

BOOKS_FILE = 'store/books.json'.freeze
LABELS_FILE = 'store/labels.json'.freeze

class App
  include AuthorModule
  include BookModule
  include LabelModule

  def initialize
    @labels = grab_labels # labels must always be before books
    @books = grab_books
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @sources = []
    @authors = []
    add_authors(@authors)
    add_default_books(@books) unless @books.length.positive?
    add_default_labels(@labels) unless @labels.length.positive?
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
end
