class Genre
  attr_accessor :name, :id
  attr_reader :item

  def initialize(name, id: Random.rand(1..1000))
    @name = name
    @id = id
    @item = []
  end

  def add_item(item)
    @item << item unless @item.include?(item)
    item.genre = self
  end
end
