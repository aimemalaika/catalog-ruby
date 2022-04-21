require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'modules/author_module'
require_relative 'modules/book_module'
require_relative 'modules/label_module'
require_relative 'inputs/inputs'
require_relative 'inputs/new_book_input'
require 'json'

class App
  include AuthorModule
  include AddBooks
  include AddLabels

  def initialize
    @labels = load_labels
    @books = load_books
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @sources = []
    @authors = []
    add_authors(@authors)
    add_books(@books) unless @books.length.positive?
    add_labels(@labels) unless @labels.length.positive?
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
    books = @books.each_with_index.map do |book, index|
      { class: book.class, publisher: book.publisher, cover_state: book.cover_state,
        label: (book.label ? book.label.id : nil),
        index: index, id: book.id }
    end
    json_books = JSON.generate(books)
    File.write('books.json', json_books)
  end

  def save_labels
    labels = @labels.each_with_index.map do |label, _index|
      items = []
      @books.each do |book|
        items << book.id if book.label == label
      end

      { class: label.class, title: label.title, color: label.color, items: items, id: label.id }
    end
    json_labels = JSON.generate(labels)
    File.write('labels.json', json_labels)
  end

  def load_labels
    return [] unless File.exist?('labels.json')

    file = File.open('labels.json')
    labels_read = File.read(file)
    labels_json = JSON.parse(labels_read)
    loaded_labels = []
    labels_json.each do |label|
      loaded_labels << Label.new(label['title'], label['color'], label['items'], id: label['id'])
    end
    file.close
    loaded_labels
  end

  def load_books
    return [] unless File.exist?('books.json')

    file = File.open('books.json')
    books_read = File.read(file)
    books_json = JSON.parse(books_read)
    loaded_books = []

    books_json.each do |book|
      book_label = @labels.select { |label| label.id == book['label'] }
      single_book = Book.new(book['publisher'], book['cover_state'], id: book['id'])
      single_book.add_label(book_label[0]) unless book_label.empty?
      loaded_books << single_book
    end
    file.close
    loaded_books
  end
end
