class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color='Unknown', items=[], id: Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
  end
end