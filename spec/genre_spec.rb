require_relative '../classes/genre'

describe Genre do
  before(:each) do
    @genre = Genre.new('Rock')
  end

  it 'should be an instance of Genre' do
    expect(@genre).to be_an_instance_of(Genre)
  end

  it 'should have a name' do
    expect(@genre.name).to eq('Rock')
  end

  it 'should have an id' do
    expect(@genre.id).to be_instance_of(Integer)
  end

  it 'should have an item' do
    expect(@genre.item).to be_instance_of(Array)
  end

  it 'should be able to add an item' do
    @item = Item.new('12/02/2018', false)
    @genre.add_item(@item)
    expect(@genre.item).to include(@item)
  end
end
