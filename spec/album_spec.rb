require_relative '../classes/albums'
require_relative '../classes/item'

describe MusicAlbum do
  it 'should be an instance of MusicAlbum' do
    @album = MusicAlbum.new(id: 1, publish_date: '12/02/2018', archived: false, on_spotify: false)
    expect(@album).to be_an_instance_of(MusicAlbum)
  end

  it 'should be an instance of Item' do
    @album = MusicAlbum.new(id: 1, publish_date: '12/02/2018', archived: false, on_spotify: false)
    expect(@album.class.superclass).to be Item
  end

  it 'should have an id' do
    @album = MusicAlbum.new(id: 1, publish_date: '12/02/2018', archived: false, on_spotify: false)
    expect(@album.id).to eq(1)
  end

  it 'should have a publish date' do
    @album = MusicAlbum.new(id: 1, publish_date: '12/02/2018', archived: false, on_spotify: false)
    expect(@album.publish_date).to eq('12/02/2018')
  end

  it 'should have an archived status' do
    @album = MusicAlbum.new(id: 1, publish_date: '12/02/2018', archived: false, on_spotify: false)
    expect(@album.archived).to eq(false)
  end

  it 'should have an on_spotify status' do
    @album = MusicAlbum.new(id: 1, publish_date: '12/02/2018', archived: false, on_spotify: false)
    expect(@album.on_spotify).to eq(false)
  end

  it 'should be able to be archived' do
    @album = MusicAlbum.new(id: 1, publish_date: '12/02/2005', archived: false, on_spotify: false)
    @album.move_to_archive
    expect(@album.archived).to eq(true)
  end
end
