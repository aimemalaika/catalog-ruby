require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'inputs/inputs'
require_relative 'modules/author_module'

class App
  include AuthorModule

  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @sources = []
    @authors = []
    add_authors(@authors)
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
            publish: #{game.publish_date}"
    end
  end
end
