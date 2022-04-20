require './modules/book_module'
require './modules/label_module'

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
end
