require './classes/book'

class App
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
    add_books
  end

  def add_books
    temp_arr = ['Ohara good', 'Killer bad', 'Whale perfect', 'Hawaii dirty']
    temp_arr.each do |str|
      publisher, cover_state = str.split
      @books << Book.new(publisher, cover_state)
    end
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts "[#{index + 1}] Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end
end
