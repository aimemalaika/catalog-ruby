require 'json'
require_relative './classes/genre'
require_relative './modules/list_genre'

class App
  include GenreList

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = load_genres
    @labels = []
    @authors = []
    @sources = []
    save_genres
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
end
