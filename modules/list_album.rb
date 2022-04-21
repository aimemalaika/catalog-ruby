require_relative '../classes/albums'

module ManageAlbums
  def load_albums
    if File.exist?('./data/albums.json') && File.read('./data/albums.json') != ''
      JSON.parse(File.read('./data/albums.json')).each do |album|
        MusicAlbum.new(album['publish_date'], album['archived'], album['on_spotify'], id: album['id'])
      end
    else
      []
    end
  end

  def save_music_albums
    data = []
    @music_albums.each do |album|
      data << {
        'publish_date' => album['publish_date'],
        'archived' => album['archived'],
        'on_spotify' => album['on_spotify'],
        'genre' => album['genre'],
        'id' => album['id']
      }
    end
    open('./data/albums.json', 'w') { |file| file.write(data.to_json) }
  end
end
