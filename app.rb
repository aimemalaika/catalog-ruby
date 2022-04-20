require 'json'
require_relative './classes/genre'
require_relative './modules/list_genre'
require_relative './classes/albums'
require_relative './modules/list_album'

class App
  include GenreList
  include ManageAlbums

  def initialize
    @books = []
    @music_albums = load_albums
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

  def list_all_music_albums
    puts "\n\n\nAlbums:\n------------"
    @music_albums.each do |album|
      puts "#{album['id']}. (#{album['publish_date']}) - #{album['archived']} - #{album['on_spotify']}"
    end
    puts "\n--------------------\n\n\n"
  end

  def add_music_album
    puts "\n\n\nAdd a new album:\n------------"
    puts 'Enter publication date of the album:'
    publish_date = gets.chomp
    puts 'Is the album archived? (y/n)'
    archived = gets.chomp == 'y'
    puts 'Is the album on Spotify? (y/n)'
    on_spotify = gets.chomp == 'y'
    new_album = MusicAlbum.new(publish_date, archived, on_spotify)
    @music_albums << new_album
    save_music_albums
    puts "\n\n\nAlbum added!\n------------\n\n\n"
  end
end
