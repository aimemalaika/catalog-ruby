require_relative '../classes/albums'
require_relative '../classes/item'

describe MusicAlbum do
  album = MusicAlbum.new(id: 1, publish_date: '12/02/2018', archived: false, on_spotify: false)

  it 'should be an instance of MusicAlbum' do
    expect(album).to be_an_instance_of(MusicAlbum)
  end

  it 'should be an instance of a child Item' do
    expect(album.class.superclass).to be Item
  end

  it 'should have an id' do
    expect(album.id).to eq(1)
  end

  it 'should have a publish date' do
    expect(album.publish_date).to eq('12/02/2018')
  end

  it 'should have an archived status' do
    expect(album.archived).to eq(false)
  end

  it 'should have an on_spotify status' do
    expect(album.on_spotify).to eq(false)
  end

  it 'should be able to be archived' do
    album = MusicAlbum.new(id: 1, publish_date: '12/02/2005', archived: false, on_spotify: false)
    album.move_to_archive
    expect(album.archived).to eq(true)
  end
end
