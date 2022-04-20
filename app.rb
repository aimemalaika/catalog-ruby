require './modules/book_module'
require './modules/label_module'
require './inputs/sanchito_inputs'

class App
  include AddBooks
  include AddLabels
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
    add_books(@books)
    add_labels(@labels)
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
    publisher, cover_state =  grap_book_data

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
