require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id: Rand.random(1.1000), publish_date: Date.today.year, archived: false, on_spotify: false)
    super(id: id, publish_date: publish_date, archived: archived)
    @on_spotify = on_spotify
  end
end
