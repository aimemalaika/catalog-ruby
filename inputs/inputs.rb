def grap_game_data
  print 'Is this game for multiple players? [Y/N]: '
  multiplayer = gets.chomp.downcase
  multiplayer = multiplayer == 'y'

  print 'Please enter the date this game was last played in: '
  last_played_at = gets.chomp

  print 'Please enter the date this game was published: '
  publish_date = gets.chomp

  [multiplayer, last_played_at, publish_date]
end
