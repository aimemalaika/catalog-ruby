require_relative '../classes/albums'
require_relative '../classes/item'

describe MusicAlbum do
  before(:each) do
    @album = MusicAlbum.new('12/02/2018', false, false)
  end

  it 'should be an instance of MusicAlbum' do
    expect(@album).to be_an_instance_of(MusicAlbum)
  end

  it 'should be an instance of Item' do
    expect(@album.class.superclass).to be Item
  end

  it 'should have an id' do
    expect(@album.id).to be_instance_of(Integer)
  end

  it 'should have a publish date' do
    expect(@album.publish_date).to eq('12/02/2018')
  end

  it 'should have an archived status' do
    expect(@album.archived).to eq(false)
  end

  it 'should have an on_spotify status' do
    expect(@album.on_spotify).to eq(false)
  end

  it 'should be able to be archived' do
    @album = MusicAlbum.new('12/02/2005', false, false)
    @album.move_to_archive
    expect(@album.archived).to eq(false)
  end

  it 'should be able to be archived' do
    @album = MusicAlbum.new('12/02/2005', false, true)
    @album.move_to_archive
    expect(@album.archived).to eq(true)
  end
end
