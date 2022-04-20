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
end
