require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived, on_spotify: false, id: Random.rand(1..1000))
    super(publish_date, archived, id: id)
    @on_spotify = on_spotify
  end
end
