require_relative '../classes/game'
require 'json'

def read_games
  data = []
  if File.exist?('games.json')
    games_data = JSON.parse(File.read('games.json'))
    games_data.each do |game|
      data.push(Game.new(game['multiplayer'], game['last_played_at'], game['publish_date']))
    end
  end
  data
end

