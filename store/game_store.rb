require 'json'

def save_games(games)
  games_data = []
  games.each do |game|
    games_data.push(
      {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date
      }
    )
  end
  File.write('./data/games.json', JSON.generate(games_data))
end
